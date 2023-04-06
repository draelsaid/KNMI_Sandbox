import os
import subprocess

def operate_on_subfolders(root):
    for dirpath, dirnames, filenames in os.walk(root):
        filenames = sorted(filenames)
        for filename in filenames:
            file_without_suffix, file_suffix = os.path.splitext(filename)
            if file_suffix == '':
                file_path = os.path.join(dirpath, filename)
                output_file_path = os.path.join(dirpath, filename + '_grib2')
                print('doing this one: ' + filename)
                command = ['/perm/nkac/bin/gl', '-p', file_path, '-o', output_file_path, '-of', 'GRIB2']
                subprocess.run(command, check=False)
            elif file_suffix == '.sfx':
                print('doing this one: ' + filename)
                file_path2 = os.path.join(dirpath, filename)
                output_file_path2 = os.path.join(dirpath, filename + '_grib')
                command = ['/perm/nkac/bin/gl', '-p', file_path2, '-o', output_file_path2, '-of', 'GRIB']
                subprocess.run(command, check=False)
            elif file_suffix == '_grib' or file_suffix == '_grib2':
                continue

root = os.getcwd()
operate_on_subfolders(root)

