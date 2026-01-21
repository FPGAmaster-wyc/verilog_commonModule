#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <getopt.h>
#include <stdint.h>

#include "libudma.h"

// 函数声明，与 libudma.h 保持一致
extern int ReadRegister(DeviceHandle hDev, uint32_t offset, uint32_t *buf);
extern int WriteRegister(DeviceHandle hDev, uint32_t offset, uint32_t data);
extern DeviceHandle DeviceOpen(int index);
extern int DeviceClose(DeviceHandle hDev);

// 显示使用帮助信息
void usage(const char *progname) {
    fprintf(stderr, "使用方法: %s -r <地址> | -w <地址> <数据>\n", progname);
    fprintf(stderr, "  -r <地址>       从 AXI Lite 寄存器地址 <地址> (十六进制) 读取数据\n");
    fprintf(stderr, "  -w <地址> <数据> 向 AXI Lite 寄存器地址 <地址> (十六进制) 写入 <数据> (十六进制)\n");
    exit(1);
}

int main(int argc, char *argv[]) {
    int opt;
    int read_mode = 0; // 0 表示写操作，1 表示读操作
    uint32_t address = 0; // 寄存器地址
    uint32_t data = 0; // 写入数据
    int device_index = 0; // 设备索引，默认使用 0

    // 检查命令行参数数量
    if (argc < 3) {
        usage(argv[0]);
    }

    // 解析命令行选项
    while ((opt = getopt(argc, argv, "r:w:")) != -1) {
        switch (opt) {
            case 'r':
                read_mode = 1; // 设置为读模式
                address = (uint32_t)strtoul(optarg, NULL, 16); // 转换为十六进制地址
                break;
            case 'w':
                read_mode = 0; // 设置为写模式
                address = (uint32_t)strtoul(optarg, NULL, 16); // 转换为十六进制地址
                if (optind >= argc) {
                    fprintf(stderr, "错误：写操作需要提供数据值\n");
                    usage(argv[0]);
                }
                data = (uint32_t)strtoul(argv[optind], NULL, 16); // 转换为十六进制数据
                break;
            default:
                usage(argv[0]);
        }
    }

    // 打开设备
    DeviceHandle hDev = DeviceOpen(device_index);
    if (!hDev) {
        perror("设备打开失败");
        return -1;
    }

    // 执行读或写操作
    if (read_mode) {
        uint32_t value;
        if (ReadRegister(hDev, address, &value) != 0) {
            perror("寄存器读取失败");
            DeviceClose(hDev);
            return -1;
        }
        printf("从地址 0x%08x 读取数据: 0x%08x\n", address, value);
    } else {
        if (WriteRegister(hDev, address, data) != 0) {
            perror("寄存器写入失败");
            DeviceClose(hDev);
            return -1;
        }
        printf("向地址 0x%08x 写入数据: 0x%08x\n", address, data);
    }

    // 关闭设备
    if (DeviceClose(hDev) != 0) {
        perror("设备关闭失败");
        return -1;
    }

    return 0;
}