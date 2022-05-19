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


#copy files from .\RadioBenZviWebsite\assets\Scripts\PAWS\ to .\RadioBenZviWebsiteBuild\assets\assets\Scripts\PAWS\
print("Copying files...")
copy_tree(cwd + "\\RadioBenZviWebsite\\assets\\Scripts\\PAWS\\", cwd + "\\RadioBenZviWebsiteBuild\\assets\\assets\\Scripts\\PAWS\\")

#move the files from .\RadioBenZviWebsite\build\web\ to .\RadioBenZviWebsiteBuild\
print("Copying new files...")
copy_path = cwd + "\\RadioBenZviWebsite\\build\\web\\"
copy_dest = cwd + "\\RadioBenZviWebsiteBuild"
copy_tree(copy_path, copy_dest)

#create an html file that called home and redirect to "RadioBenZvi.github.io/#/home"
print("Creating redirect file...")
with open(cwd + "\\RadioBenZviWebsiteBuild\\home.html", "w") as f:
    f.write("<!DOCTYPE html>\n")
    f.write("<html>\n")
    f.write("<head>\n")
    f.write("<title> Radio Ben Zvi </title>\n")
    f.write("<meta http-equiv=\"refresh\" content=\"0; url=https://RadioBenZvi.github.io/#/home\" />\n")
    f.write("</head>\n")
    f.write("</html>\n")

#create an html file that called PAWS1 and redirect to "RadioBenZvi.github.io/#/Scripts/PAWS/1"
print("Creating redirect file...")
with open(cwd + "\\RadioBenZviWebsiteBuild\\PAWS1.html", "w") as f:
    f.write("<!DOCTYPE html>\n")
    f.write("<html>\n")
    f.write("<head>\n")
    f.write("<title> Radio Ben Zvi </title>\n")
    f.write("<meta http-equiv=\"refresh\" content=\"0; url=https://RadioBenZvi.github.io/#/Scripts/PAWS/1\" />\n")
    f.write("</head>\n")
    f.write("</html>\n")

with open(cwd + "\\RadioBenZviWebsiteBuild\\PAWS2.html", "w") as f:
    f.write("<!DOCTYPE html>\n")
    f.write("<html>\n")
    f.write("<head>\n")
    f.write("<title> Radio Ben Zvi </title>\n")
    f.write("<meta http-equiv=\"refresh\" content=\"0; url=https://RadioBenZvi.github.io/#/Scripts/PAWS/2\" />\n")
    f.write("</head>\n")
    f.write("</html>\n")

with open(cwd + "\\RadioBenZviWebsiteBuild\\PAWS3.html", "w") as f:
    f.write("<!DOCTYPE html>\n")
    f.write("<html>\n")
    f.write("<head>\n")
    f.write("<title> Radio Ben Zvi </title>\n")
    f.write("<meta http-equiv=\"refresh\" content=\"0; url=https://RadioBenZvi.github.io/#/Scripts/PAWS/3\" />\n")
    f.write("</head>\n")
    f.write("</html>\n")

with open(cwd + "\\RadioBenZviWebsiteBuild\\PAWS4.html", "w") as f:
    f.write("<!DOCTYPE html>\n")
    f.write("<html>\n")
    f.write("<head>\n")
    f.write("<title> Radio Ben Zvi </title>\n")
    f.write("<meta http-equiv=\"refresh\" content=\"0; url=https://RadioBenZvi.github.io/#/Scripts/PAWS/4\" />\n")
    f.write("</head>\n")
    f.write("</html>\n")

with open(cwd + "\\RadioBenZviWebsiteBuild\\PAWS5.html", "w") as f:
    f.write("<!DOCTYPE html>\n")
    f.write("<html>\n")
    f.write("<head>\n")
    f.write("<title> Radio Ben Zvi </title>\n")
    f.write("<meta http-equiv=\"refresh\" content=\"0; url=https://RadioBenZvi.github.io/#/Scripts/PAWS/5\" />\n")
    f.write("</head>\n")
    f.write("</html>\n")

#finished processing
print("Finished!")