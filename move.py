from distutils.dir_util import copy_tree
from os                 import getcwd, listdir, chmod, system, unlink
from stat               import S_IWRITE

#get the current working directory
cwd = getcwd()

#delete the old files from .\RadioBenZviWebsiteBuild
def remove_read_only(path):
    # path contains the path of the file that couldn't be removed
    # let's just assume that it's read-only and unlink it.
    chmod(path, S_IWRITE)
    unlink(path)

print("Deleting files...")
filelist = [ f for f in listdir(cwd + "\\RadioBenZviWebsiteBuild") if not (f.endswith(".py") or f.endswith(".git")) ]
for f in filelist:
    print(f"{cwd}\\RadioBenZviWebsiteBuild\\{f}")
    system(f"del {cwd}\\RadioBenZviWebsiteBuild\\{f}")


#move the files from .\RadioBenZviWebsite\build\web\ to .\RadioBenZviWebsiteBuild\
print("Copying new files...")
copy_path = cwd + "\\RadioBenZviWebsite\\build\\web\\"
copy_dest = cwd + "\\RadioBenZviWebsiteBuild"
copy_tree(copy_path, copy_dest)

#finished processing
print("Finished!")