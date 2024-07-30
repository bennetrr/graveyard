import os
import subprocess
import sys
from pathlib import Path


def analyze(solution_file: Path):
    os.chdir(solution_file.parent)
    sys.stdout.write(f'------------------------- Analyzing {solution_file}... -------------------------\n')
    sys.stdout.flush()

    # Start the analyzer
    analyzer = subprocess.Popen((
        'upgrade-assistant',
        'analyze',
        solution_file),
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        encoding='utf-8',
        errors='replace'
    )

    # Print the output and wait for the analyzer to finish
    while analyzer.poll() is None:
        out = analyzer.stdout.readline().rstrip().lstrip()
        # Filter the output
        if out == '' or \
           out.startswith('-------------') or \
           out.startswith('We are interested in your feedback') or \
           out.startswith('Microsoft .NET Upgrade Assistant v'):
            continue

        sys.stdout.write(f'  {out}\n')
        sys.stdout.flush()

    # Check if the analyzing was successful
    if analyzer.returncode != 0:
        print(f'Error: Analyzing {solution_file} failed')
        sys.exit(1)


def upgrade(solution_file: Path, do_backup: bool):
    os.chdir(solution_file.parent)
    sys.stdout.write(f'------------------------- Upgrading {solution_file}... -------------------------\n')
    sys.stdout.flush()

    # Start the upgrader
    upgrader = subprocess.Popen((
        'upgrade-assistant',
        'upgrade',
        solution_file),
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        encoding='utf-8',
        errors='replace'
    )

    next_step_question = False
    backup_question = False

    while upgrader.poll() is None:
        out = upgrader.stdout.readline().rstrip().lstrip()

        # filtering
        if out == '' or \
           out.startswith('-------------') or \
           out.startswith('We are interested in your feedback') or \
           out.startswith('Microsoft .NET Upgrade Assistant v'):
            continue

        # Check if the user should confirm the current steps completion
        if out.startswith('Please press enter to continue...'):
            upgrader.stdin.write('\n')
            upgrader.stdin.flush()

        # Check if the user should confirm the next step
        if 'Apply next step' in out:
            next_step_question = True

            # Check for the backup question
            if 'Back up project' in out:
                backup_question = True

        if '5. Exit' in out and next_step_question:
            if backup_question and not do_backup:
                upgrader.stdin.write('2\n')
                upgrader.stdin.flush()
            else:
                upgrader.stdin.write('1\n')
                upgrader.stdin.flush()

            backup_question = False
            next_step_question = False

        # Check if the user should confirm the backup location
        if '2. Enter custom path' in out:
            upgrader.stdin.write('1\n')
            upgrader.stdin.flush()

        sys.stdout.write(f'  {out}\n')
        sys.stdout.flush()

    # Check if the analyzing was successful
    if upgrader.returncode != 0:
        print('Error: Upgrading failed')
        sys.exit(1)


def main():
    # Check for help
    if len(sys.argv) > 4 or '-h' in sys.argv or '--help' in sys.argv:
        print(f'Usage: {sys.argv[0]} <solution-path> [--backup] [-y] [-h] [--help]')
        print('  <solution-path>    The path to a solution file or a directory containing one or more solution files')
        print('                     If a directory with multiple solution files is given, all of them will be upgraded')
        print('  [--no-backup]      If the single projects should be backed up before upgrading')
        print('  [-y]               Don\'t ask for confirmation before upgrading')
        print('  [-h] [--help]      Show this help message')
        sys.exit(0)

    # Get the arguments
    solution_path = Path(sys.argv[1])
    do_backup = '--no-backup' not in sys.argv
    auto_confirm = '-y' in sys.argv

    # Check if the solution path exists
    if not solution_path.exists():
        print(f'Error: The solution path {solution_path} does not exist')
        sys.exit(1)

    # Check if the solution path is a directory
    if solution_path.is_dir():
        # Get all solution files
        solution_files = list(solution_path.glob('**/*.sln'))

        # Check if there are any solution files
        if len(solution_files) == 0:
            print(f'Error: No solution files found in {solution_path}')
            sys.exit(1)
    else:
        # Check if the solution file is a .sln file
        if solution_path.suffix != '.sln':
            print(f'Error: The file {solution_path} is not a solution file')
            sys.exit(1)

        # Create a list with the solution file
        solution_files = [solution_path]

    solution_files = [x.resolve() for x in solution_files]

    # Print files
    print(f'Found {len(solution_files)} solution files:')
    for file in solution_files:
        print(f'  {file}')
    print('\n')

    # Analyze all solution files
    for solution_file in solution_files:
        analyze(solution_file.resolve())

    # Check if the user wants to upgrade
    if not auto_confirm:
        sys.stdout.write('\nDo you want to upgrade the solutions? [y/N] ')
        sys.stdout.flush()
        answer = input()

        if answer != 'y':
            print('Aborting...')
            sys.exit(0)

    # Upgrade all solution files
    for solution_file in solution_files:
        upgrade(solution_file, do_backup)


if __name__ == '__main__':
    main()
