#!/bin/bash

# Global Variables
export DownloadDir="/tmp/archdeploy"
export Note='[\033[1;34mNOTE\033[0m]'
export OK='[\033[1;32mOK\033[0m]'
export Action='[\033[1;33mACTION\033[0m]'
export Error='[\033[1;31mERROR\033[0m]'
export Clear='\033[1A\033[K'

clear && echo -e "\033[1;32m
                    -@                           
                   .##@                          
                  .####@                         
                  @#####@                        
                . *######@                       
               .##@o@#####@                                                                ,,                           ,,  
              /############@                      \`7MMF'  \`7MMF'                         \`7MM                         \`7MM  
             /##############@             M         MM      MM                             MM                           MM  
            @######@**%######@            M         MM      MM \`7M'   \`MF\`7MMpdMAo\`7Mb,od8 MM  ,6\"Yb. \`7MMpMMMb.   ,M\"\"bMM  
           @######\`     %#####o       mmmmMmmmm     MMmmmmmmMM   VA   ,V   MM   \`Wb MM' \"' MM 8)   MM   MM    MM ,AP    MM  
          @######@       ######%          M         MM      MM    VA ,V    MM    M8 MM     MM  ,pm9MM   MM    MM 8MI    MM  
        -@#######h       ######@.\`        M         MM      MM     VVV     MM   ,AP MM     MM 8M   MM   MM    MM \`Mb    MM  
       /#####h**\`\`       \`**%@####@               .JMML.  .JMML.   ,V      MMbmmd'.JMML. .JMML\`Moo9^Yo.JMML  JMML.\`Wbmd\"MML.
      @H@*\`                    \`*%#@                              ,V       MM                                               
     *\`                            \`*                          OOb\"      .JMML.                                             

\033[0m"

# Check if is Archlinux
source /etc/os-release
[[ ! "${ID}" == "arch" ]] && {
    echo -e "${Error} - It seems that the system is not ArchLinux. Aborting..."
    exit 1
}

# Check if running as root. If root, script will exit
[[ $UID -eq 0 ]] && {
    echo "${Error} - This script should not be executed as root! Exiting..."
    exit 1
}

# Downloading files
GitRepo="https://github.com/x86mota/archdeploy.git"
echo -e "${Note} - Downloading files..."
[[ -d "${DownloadDir}" ]] && rm -rf "${DownloadDir}"
git clone --quiet --depth=1 "${GitRepo}" "${DownloadDir}" && {
  echo -e "${Clear}${OK} - Downloading files..."
}

# Set executable permissions
cd "${DownloadDir}/scripts" || exit
    chmod u+x main.sh
    source ./main.sh