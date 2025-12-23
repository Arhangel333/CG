# Используем официальный образ с Vulkan SDK и CMake
FROM ubuntu:22.04

# Обновляем систему
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    cmake \
    ninja-build \
    g++ \
    git \
    x11-apps \              # для xeyes (тест X11)
    vulkan-sdk \
    libvulkan1 \
    libvulkan-dev \
    mesa-vulkan-drivers \
    libglfw3-dev \
    libglm-dev \
    libx11-xcb-dev \
    libxcb-keysyms1-dev \
    libxcb-icccm4-dev \
    libxcb-randr0-dev \
    libxcb-render-util0-dev \
    libxcb-shape0-dev \
    libxcb-xfixes0-dev \
    libxcb-xkb-dev \
    libxkbcommon-dev \
    libxkbcommon-x11-dev \
    && rm -rf /var/lib/apt/lists/*

# Копируем исходники
WORKDIR /app
COPY . .

# Собираем
RUN mkdir build && cd build && \
    cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug .. && \
    ninja

# Запуск
CMD ["./build/testbed"]