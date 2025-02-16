#!/bin/bash

# Global Variables
export DownloadDir="/tmp/hypr-arch"
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