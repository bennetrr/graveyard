#! /usr/bin/env python3

import json
import sys
from pathlib import Path
import requests
import furl

def main():
    if len(sys.argv) != 2 or sys.argv[1] in ('help', '--help', '-help', '/help', 'h', '-h', '/h', '?', '-?', '/?'):
        print('''WeckPi Playlist Tester v.1
        Usage: playlist_tester <path-to-playlist>''')
        sys.exit()

    file_path = Path(sys.argv[1])

    if not file_path.is_file():
        raise FileNotFoundError('Input file not found')

    playlist_data: list[str] = json.load(file_path.open())

    print('Starting testing...')

    errors = 0

    for index, item in enumerate(playlist_data):
        response = requests.head(item)
        if response.status_code == 200:
            continue
        print(f'Item not found on line {index + 2}: {item}')
        errors += 1

    print(f'Finished testing: {errors} failed from {len(playlist_data)} total')

    if errors != 0:
        sys.exit()

    print('Escaping characters...')

    quoted_data = [furl.furl(item).url for item in playlist_data]

    json.dump(quoted_data, file_path.open('w'), indent=2)

if __name__ == '__main__':
    main()
