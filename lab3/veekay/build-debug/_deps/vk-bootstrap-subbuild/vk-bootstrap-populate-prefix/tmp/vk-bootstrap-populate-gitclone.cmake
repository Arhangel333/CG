
if(NOT "/mnt/c/Users/Max Kar/Desktop/МАИ/CG/архив и отчет по работе/lab2/veekay/build-debug/_deps/vk-bootstrap-subbuild/vk-bootstrap-populate-prefix/src/vk-bootstrap-populate-stamp/vk-bootstrap-populate-gitinfo.txt" IS_NEWER_THAN "/mnt/c/Users/Max Kar/Desktop/МАИ/CG/архив и отчет по работе/lab2/veekay/build-debug/_deps/vk-bootstrap-subbuild/vk-bootstrap-populate-prefix/src/vk-bootstrap-populate-stamp/vk-bootstrap-populate-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/mnt/c/Users/Max Kar/Desktop/МАИ/CG/архив и отчет по работе/lab2/veekay/build-debug/_deps/vk-bootstrap-subbuild/vk-bootstrap-populate-prefix/src/vk-bootstrap-populate-stamp/vk-bootstrap-populate-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/mnt/c/Users/Max Kar/Desktop/МАИ/CG/архив и отчет по работе/lab2/veekay/build-debug/_deps/vk-bootstrap-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/mnt/c/Users/Max Kar/Desktop/МАИ/CG/архив и отчет по работе/lab2/veekay/build-debug/_deps/vk-bootstrap-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"  clone --no-checkout --config "advice.detachedHead=false" "https://github.com/charles-lunarg/vk-bootstrap" "vk-bootstrap-src"
    WORKING_DIRECTORY "/mnt/c/Users/Max Kar/Desktop/МАИ/CG/архив и отчет по работе/lab2/veekay/build-debug/_deps"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/charles-lunarg/vk-bootstrap'")
endif()

execute_process(
  COMMAND "/usr/bin/git"  checkout v0.7 --
  WORKING_DIRECTORY "/mnt/c/Users/Max Kar/Desktop/МАИ/CG/архив и отчет по работе/lab2/veekay/build-debug/_deps/vk-bootstrap-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'v0.7'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/bin/git"  submodule update --recursive --init 
    WORKING_DIRECTORY "/mnt/c/Users/Max Kar/Desktop/МАИ/CG/архив и отчет по работе/lab2/veekay/build-debug/_deps/vk-bootstrap-src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/mnt/c/Users/Max Kar/Desktop/МАИ/CG/архив и отчет по работе/lab2/veekay/build-debug/_deps/vk-bootstrap-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/mnt/c/Users/Max Kar/Desktop/МАИ/CG/архив и отчет по работе/lab2/veekay/build-debug/_deps/vk-bootstrap-subbuild/vk-bootstrap-populate-prefix/src/vk-bootstrap-populate-stamp/vk-bootstrap-populate-gitinfo.txt"
    "/mnt/c/Users/Max Kar/Desktop/МАИ/CG/архив и отчет по работе/lab2/veekay/build-debug/_deps/vk-bootstrap-subbuild/vk-bootstrap-populate-prefix/src/vk-bootstrap-populate-stamp/vk-bootstrap-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/mnt/c/Users/Max Kar/Desktop/МАИ/CG/архив и отчет по работе/lab2/veekay/build-debug/_deps/vk-bootstrap-subbuild/vk-bootstrap-populate-prefix/src/vk-bootstrap-populate-stamp/vk-bootstrap-populate-gitclone-lastrun.txt'")
endif()

