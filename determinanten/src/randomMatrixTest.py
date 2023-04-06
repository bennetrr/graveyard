import sys

import numpy as np


def main(size: int, count: int, offset: int = 0):
    """
    Create random unit tests for the matrix program

    :param size: The size of the matrix
    :param count: How many tests should be created
    :param offset: The offset for the test numbers (useful if there are already tests in the method)
    """
    gen = np.random.default_rng()
    offset += 1

    arrange = '// Arrange\n'
    act = '// Act\n'
    assert_ = '// Assert\n'


    for i in range(offset, offset + count):
        matrix: np.ndarray = gen.integers(-10, 10, (size, size))

        arrange += f'int[][] matrix{i} = {{\n'

        for zeile in matrix:
            arrange += '    {' + ', '.join([str(x) for x in zeile]) + '},\n'

        arrange += '};\n\n'

        act += f'var det{i} = new NewMatrix(matrix{i}).det();\n'

        det = round(np.linalg.det(matrix))
        if -9223372036854775807 < det < 9223372036854775807:
            assert_ += f'assertEquals({det}L, det{i});\n'
        else:
            assert_ += f'assertEquals("number too long", det{i});\n'

    print(arrange + act + '\n' + assert_)

if __name__ == '__main__':
    if len(sys.argv) != 4 or sys.argv[1] in ('-h', '--help', '-help', 'help', '?', '-?', '/?', '/h', '/help'):
        print(f'{sys.argv[0]} -- Create random unit tests for the matrix program')
        print('Usage:')
        print(f'{sys.argv[0]} <size> <count> <offset>')
        print()
        print('<size: int> The size of the matrix')
        print('<count: int> How many tests should be created')
        print('<offset: int> The offset for the test numbers (useful if there are already tests in the method)')
        exit()

    s = int(sys.argv[1])
    c = int(sys.argv[2])
    o = int(sys.argv[3])

    main(s, c, o)
