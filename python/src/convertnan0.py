from os import listdir
from os.path import join, isfile

if __name__ == "__main__":
    project_folder = '/media/alexanderfernandes/6686E8B186E882C3/Users/alexanderfernandes/Code/BIOM5405-ClassProject/'
    project_folder += 'data/'

    file_list = [f for f in listdir(project_folder) if isfile(join(project_folder, f))]
    for file_name in file_list:
        myfile = open(project_folder + file_name, 'r')
        data = myfile.read()
        data = data.replace("-Inf", "0")
        data = data.replace("Inf", "0")
        myfile.close()
        myfile = open(project_folder + file_name, 'w')
        myfile.write(data)

