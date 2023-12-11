def count_instructions(file_path):
    sl_count = 0
    branch_count = 0
    vector_count = 0
    math_intrinsic_count = 0

    # 打开.ll文件进行读取
    with open(file_path, 'r') as file:
        lines = file.readlines()

    # 遍历文件中的每一行
    for line in lines:
        # 统计store指令数量
        if 'store' in line or '= load' in line:
            sl_count += 1

        # 统计跳转指令数量
        if 'br' in line or 'switch' in line:
            branch_count += 1


        # 统计向量指令数量
        if 'vector' in line:
            vector_count += 1

        # 统计数学相关intrinsic数量
        if 'llvm.' in line and 'intrinsic' in line:
            math_intrinsic_count += 1

    # 打印统计结果
    print(f"访存指令数量: {sl_count}")
    print(f"跳转指令数量: {branch_count}")
    print(f"向量指令数量: {vector_count}")
    print(f"数学相关intrinsic数量: {math_intrinsic_count}")

# 调用函数并传入.ll文件的路径
count_instructions('../benchmarks/bfs/src/opencl_base/kernel.ll')