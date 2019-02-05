import os

def main():
    dir = input('input the folder path: ')
    print('you have ' + str(len(os.listdir(dir))) + ' in this folder')
    print('\nPick the same extension type from the files you wish to rename')
    format = input('\nchoose an extension type (txt, jpeg, csv..etc): ')

    while True:
        list = os.listdir(dir)
        totalFiles = len(list)

        list.sort()
        resp = input('\ncontinue? (y/n)\n')
        if(resp == 'n'):
            break
        else:
            i = 1
            from_n = -1
            to_n = 0
            while (from_n > to_n) or (from_n < 0):
                from_n = int(input('From file number : '))-1
                to_n = int(input('To file number : '))

            if to_n > totalFiles:
                to_n = totalFiles

            name = input('\nwill be named : ')
            for item in range(from_n, to_n):
                newName = name + str(i) + '.' + format
                source = dir + '/' + list[item]
                output = dir + '/' + newName
                os.rename(source, output)
                i += 1
            print('\nDone!')

main()
