set(port_version 0.9.9)

project(pocketpy VERSION ${port_version})

# 安装目标
set(port_install_headers
    "${CMAKE_CURRENT_LIST_DIR}/pocketpy.h"
)

# 设置编译选项
set(port_cxx_compile_options
    "-std:c++17"
    # 开启异常
    "$<$<CXX_COMPILER_ID:MSVC>:/EHsc>"
    "$<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-fexceptions>"
)

# 添加 vcpkg 的配置文件
vcpkg_configure_cmake_port(pocketpy ${port_version}
    SOURCE_DIR "${CMAKE_CURRENT_LIST_DIR}" # 设置源码目录
    INSTALL_HEADERS "${port_install_headers}" # 安装目标是头文件
    INCLUDE_DIRS "${port_include_dir}" # 指定头文件目录
    CMAKE_OPTIONS "-DCMAKE_CXX_STANDARD=17" # 开启 C++17 的支持
    CXX_FLAGS "${port_cxx_compile_options}" # 设置编译选项
)