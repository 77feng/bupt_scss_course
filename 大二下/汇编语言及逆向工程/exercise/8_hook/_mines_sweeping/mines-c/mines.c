/**
 * ----------------------------------------------------------------------------
 * [源文件] 游戏
 * ----------------------------------------------------------------------------
 *
 * 定义扫雷游戏的各个功能函数
 *
 */

#include <windows.h>
#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>
#include <string.h>
#include <limits.h>

#include "mines.h"

unsigned char mines_title[] = "扫雷";

/**
 * 创建一个游戏
 *
 * @return                  分配的内存地址
 */
Game * CreateGame() {
    // 游戏指针
    Game *game;

    // 为游戏分配内存
    game = (Game *)malloc(sizeof(Game));

    // 若分配成功
    if (game) {
        // 初始化游戏
        InitializeGame(game);
    }

    // 分配成功返回内存地址，失败返回NULL
    return game;
}

/**
 * 销毁游戏
 *
 * @param game              游戏指针的指针
 */
void DestroyGame(Game **game) {
    // 释放内存
    free(*game);
    // 将指针置为空
    *game = NULL;
}

/**
 * 初始化游戏
 *
 * @param game              游戏指针
 */
void InitializeGame(Game *game) {
    // 设置游戏未完成
    game->is_finished = 0;
    // 设置游戏未胜利
    game->is_winning = 0;
    // 暂不创建地图，置指针为空
    game->map = NULL;
}

/**
 * 创建地图
 *
 * @param rows              行数
 * @param columns           列数
 * @param mines             地雷数
 * @return                  分配的内存地址
 */
Map * CreateMap(int rows, int columns, int mines) {
    // 地图指针
    Map *map;

    // 为地图分配内存
    map = (Map *)malloc(sizeof(Map));

    // 若分配成功
    if (map) {
        // 初始化地图
        InitializeMap(map, rows, columns, mines);
    }

    // 分配成功返回内存地址，失败返回NULL
    return map;
}

/**
 * 销毁地图
 *
 * @param map               地图指针的指针
 */
void DestroyMap(Map **map) {
    // 行下标
    int row;

    // 释放方块表各行内存
    for (row = 0; row < (*map)->number_of_rows; row++) {
        free((*map)->blocks[row]);
    }
    // 释放整个方块表内存
    free((*map)->blocks);
    // 释放地图内存
    free(*map);
    // 将指针置为空
    *map = NULL;
}

/**
 * 初始化地图
 *
 * @param map               地图指针
 * @param rows              行数
 * @param columns           列数
 * @param mines             地雷数
 */
void InitializeMap(Map *map, int rows, int columns, int mines) {
    // 行下标
    int row;

    // 设置行数
    map->number_of_rows = rows;
    // 设置列数
    map->number_of_columns = columns;
    // 设置地雷数
    map->number_of_mines = mines;
    // 计算方块总数
    map->number_of_blocks = map->number_of_rows * map->number_of_columns;
    // 设置可见方块数
    map->number_of_visible_blocks = 0;
    // 设置不可见方块数
    map->number_of_invisible_blocks = map->number_of_blocks - map->number_of_visible_blocks;
    // 设置旗标数
    map->number_of_flags = 0;
    // 设置疑问标数
    map->number_of_doubts = 0;
    // 设置可见地雷数
    map->number_of_visible_mine_blocks = 0;

    // 为方块表分配内存
    // 分配行指针数组内存
    map->blocks = (Block**)malloc(sizeof(Block *) * map->number_of_rows);
    // 分配每行的方块内存
    for (row = 0; row < map->number_of_rows; row++) {
        map->blocks[row] = (Block *)malloc(sizeof(Block) * map->number_of_columns);
    }
    // 清空方块表
    ClearBlockTable(map->blocks, map->number_of_rows, map->number_of_columns);
}

/**
 * 清空方块表
 *
 * @param blocks            方块表指针
 * @param rows              行数
 * @param columns           列数
 */
void ClearBlockTable(Block **blocks, int rows, int columns) {
    // 行下标
    int row;
    // 列下标
    int column;

    for (row = 0; row < rows; row++) {
        for (column = 0; column < columns; column++) {
            // 类型设置为空
            blocks[row][column].type = BLOCK_TYPE_BLANK;
            // 状态设置为不可见
            blocks[row][column].status = BLOCK_STATUS_INVISIBLE;
        }
    }
}

/**
 * 随机散布地雷
 *
 * @param map               地图指针
 */
void RandomDistributeMines(Map *map) {
    // 行下标
    int row = 0;
    // 列下标
    int column = 0;
    // 地雷计数
    int mine = 0;

    // 将当前时间设置为随机数种子
    srand((unsigned)time(NULL));

    /*
     * 将地雷散布到地图中
     */

    for (mine = 0; mine < map->number_of_mines; mine++) {
        // 随机行下标
        row = rand() % map->number_of_rows;
        // 随机列下标
        column = rand() % map->number_of_columns;

        // 若该方块类型为空，则放置地雷
        if (map->blocks[row][column].type == BLOCK_TYPE_BLANK) {
            map->blocks[row][column].type = BLOCK_TYPE_MINE;
        }
        // 否则，不放置，等待下一轮
        else {
            mine--;
        }
    }

    /*
     * 计算地雷周围的数值
     */

    // 遍历每一个方块
    for (row = 0; row < map->number_of_rows; row++) {
        for (column = 0; column < map->number_of_columns; column++) {
            // 如果当前方块不为地雷
            if (map->blocks[row][column].type != BLOCK_TYPE_MINE) {
                // 若上一行存在
                if (row - 1 >= 0) {
                    // 若左一列存在，且左上方为地雷
                    if (column - 1 >= 0 && map->blocks[row - 1][column - 1].type == BLOCK_TYPE_MINE) {
                        map->blocks[row][column].type++;
                    }
                    // 若正上方为地雷
                    if (map->blocks[row - 1][column].type == BLOCK_TYPE_MINE) {
                        map->blocks[row][column].type++;
                    }
                    // 若右一列存在，且右上方为地雷
                    if (column + 1 < map->number_of_columns && map->blocks[row - 1][column + 1].type == BLOCK_TYPE_MINE) {
                        map->blocks[row][column].type++;
                    }
                }

                // 若左一列存在，且正左方为地雷
                if (column - 1 >= 0 && map->blocks[row][column - 1].type == BLOCK_TYPE_MINE) {
                    map->blocks[row][column].type++;
                }
                // 若右一列存在，且正右方为地雷
                if (column + 1 < map->number_of_columns && map->blocks[row][column + 1].type == BLOCK_TYPE_MINE) {
                    map->blocks[row][column].type++;
                }

                // 若下一行存在
                if (row + 1 < map->number_of_rows) {
                    // 若左一列存在，且左下方为地雷
                    if (column - 1 >= 0 && map->blocks[row + 1][column - 1].type == BLOCK_TYPE_MINE) {
                        map->blocks[row][column].type++;
                    }
                    // 若正下方为地雷
                    if (map->blocks[row + 1][column].type == BLOCK_TYPE_MINE) {
                        map->blocks[row][column].type++;
                    }
                    // 若右一列存在，且右下方为地雷
                    if (column + 1 < map->number_of_columns && map->blocks[row + 1][column + 1].type == BLOCK_TYPE_MINE) {
                        map->blocks[row][column].type++;
                    }
                }
            }
        }
    }
}

/**
 * 打印地图
 *
 * @param map               地图指针
 */
void PrintMap(Map *map) {
    // 行编号输出宽度
    int row_number_width = 0;
    // 列编号输出宽度
    int column_number_width = 0;
    // 行编号转换说明
    char row_number_conversion[100];
    // 列编号转换说明
    char column_number_conversion[100];
    // 行下标
    int row;
    // 列下标
    int column;
    // 临时整数
    int n;
    // 循环下标
    int i;
    // 输出宽度
    int width;
    // 居中前导空格数
    int center_prefix_space_number;

    // 计算行编号最大数字位数
    n = map->number_of_rows;
    while (n) {
        row_number_width++;
        n /= 10;
    }
    // 计算行编号转换说明
    sprintf(row_number_conversion, "%%%dd ", row_number_width);

    // 计算列编号最大数字位数
    n = map->number_of_columns;
    while (n) {
        column_number_width++;
        n /= 10;
    }
    // 最小宽度为3
    column_number_width = column_number_width >= 3 ? column_number_width : 3;
    // 计算列编号转换说明
    sprintf(column_number_conversion, " %%-%dd", column_number_width);

    // 计算输出宽度
    width = row_number_width + 1 + (1 + column_number_width) * map->number_of_columns + 1;
    // 计算居中前导空格数
    center_prefix_space_number = (CONSOLE_WIDTH - width) / 2;

    /*
     * 打印表头
     */

    // 第一行
    printf(BLOCK_TABLE_STYLE);
    // 居中前导空格
    for (i = 0; i < center_prefix_space_number; i++) {
        printf(" ");
    }
    // 表格前导空格
    for (i = 0; i < row_number_width + 1; i++) {
        printf(" ");
    }
    // 列编号
    for (column = 0; column < map->number_of_columns; column++) {
        printf(column_number_conversion, column + 1);
    }
    printf(" \n");
    // 第二行
    // 居中前导空格
    for (i = 0; i < center_prefix_space_number; i++) {
        printf(" ");
    }
    // 表格前导空格
    for (i = 0; i < row_number_width + 1; i++) {
        printf(" ");
    }
    // 顶部标尺线
    for (column = 0; column < map->number_of_columns; column++) {
        printf("+");
        for (i = 0; i < column_number_width; i++) {
            printf("-");
        }
    }
    printf("+\n");
    printf(CLEAR_STYLE);

    /*
     * 打印每一行
     */
    for (row = 0; row < map->number_of_rows; row++) {
        // 第一行
        // 居中前导空格
        for (i = 0; i < center_prefix_space_number; i++) {
            printf(" ");
        }
        // 行编号
        printf(BLOCK_TABLE_STYLE);
        printf(row_number_conversion, row + 1);
        printf(CLEAR_STYLE);

        // 行方块
        for (column = 0; column < map->number_of_columns; column++) {
            printf(BLOCK_TABLE_STYLE);
            printf("|");
            // 左边空格
            for (i = 0; i < (column_number_width - 1) / 2 - 1; i++) {
                printf(" ");
            }
            printf(CLEAR_STYLE);
            // 打印标识字符
            if (map->blocks[row][column].status == BLOCK_STATUS_INVISIBLE) {
                printf(INVISIBLE_BLOCK_STYLE);
                printf("   ");
                printf(CLEAR_STYLE);
            } else if (map->blocks[row][column].status == BLOCK_STATUS_FLAG) {
                printf(FLAG_BLOCK_STYLE);
                printf(" F ");
                printf(CLEAR_STYLE);
            } else if (map->blocks[row][column].status == BLOCK_STATUS_DOUBT) {
                printf(DOUBT_BLOCK_STYLE);
                printf(" ? ");
                printf(CLEAR_STYLE);
            } else if (map->blocks[row][column].type == BLOCK_TYPE_BLANK) {
                printf("   ");
            } else if (map->blocks[row][column].type >= BLOCK_TYPE_NUMBER_1 && map->blocks[row][column].type <= BLOCK_TYPE_NUMBER_8) {
                printf(NUMBER_BLOCK_STYLE);
                printf(" %d ", map->blocks[row][column].type);
                printf(CLEAR_STYLE);
            } else {
                printf(MINE_BLOCK_STYLE);
                printf(" * ");
                printf(CLEAR_STYLE);
            }

            // 右边空格
            printf(BLOCK_TABLE_STYLE);
            for (i = 0; i < (column_number_width - 1) - ((column_number_width - 1) / 2) - 1; i++) {
                printf(" ");
            }
            printf(CLEAR_STYLE);
        }
        printf(BLOCK_TABLE_STYLE);
        printf("|\n");
        printf(CLEAR_STYLE);
        // 第二行
        printf(BLOCK_TABLE_STYLE);
        // 居中前导空格
        for (i = 0; i < center_prefix_space_number; i++) {
            printf(" ");
        }
        // 表格前导空格
        for (i = 0; i < row_number_width + 1; i++) {
            printf(" ");
        }
        // 行间分隔标尺线
        for (column = 0; column < map->number_of_columns; column++) {
            printf("+");
            for (i = 0; i < column_number_width; i++) {
                printf("-");
            }
        }
        printf("+\n");
        printf(CLEAR_STYLE);
    }
}

/**
 * 处理一个方块
 *
 * @param map               地图指针
 * @param row               行下标
 * @param column            列下标
 * @param status            方块的目标状态
 * @return                  是否处理成功
 */
_Bool HandleBlock(Map *map, int row, int column, BlockStatus status) {
    /*
     * 检查参数
     */

    // 检查行下标范围
    if (! (row >=0 && row < map->number_of_rows)) {
        return 0;
    }
    // 检查列下标范围
    if (! (column >= 0 && column < map->number_of_columns)) {
        return 0;
    }
    // 若该方块已可见，则不可处理
    if (map->blocks[row][column].status == BLOCK_STATUS_VISIBLE) {
        return 0;
    }

    // 将方块设置为指定状态
    map->blocks[row][column].status = status;

    // 若当前方块为可见，且为空白方块，则将周围方块都设置为可见
    if (map->blocks[row][column].status == BLOCK_STATUS_VISIBLE && map->blocks[row][column].type == BLOCK_TYPE_BLANK) {
        // 结构体：位置，用于保存空白方块的行、列下标
        typedef struct {
            int row;
            int column;
        } Position;

        // 栈，保存空白方块的位置信息
        // 最大元素数一定不超过方块总数
        Position *stack = (Position *)malloc(sizeof(Position) * map->number_of_rows * map->number_of_columns);
        // 栈顶下标
        int stack_top_index = -1;

        // 将当前方块入栈
        stack_top_index++;
        stack[stack_top_index].row = row;
        stack[stack_top_index].column = column;

        // 当栈不空时，一直执行
        while (stack_top_index >= 0) {
            // 取出栈顶元素的位置信息
            row = stack[stack_top_index].row;
            column = stack[stack_top_index].column;
            // 将栈顶元素出栈
            stack_top_index--;

            // 若上一行存在
            if (row - 1 >= 0) {
                // 若左列存在
                if (column - 1 >= 0) {
                    // 若左上方为空白方块且不可见，则入栈
                    // 入栈要在设置可见之前做，以防止2个相邻的空白方块反复将对方入栈
                    if (map->blocks[row - 1][column - 1].type == BLOCK_TYPE_BLANK && map->blocks[row - 1][column - 1].status != BLOCK_STATUS_VISIBLE) {
                        stack_top_index++;
                        stack[stack_top_index].row = row - 1;
                        stack[stack_top_index].column = column - 1;
                    }
                    // 将左上方方块设置为可见
                    map->blocks[row - 1][column - 1].status = BLOCK_STATUS_VISIBLE;
                }

                // 若正上方为空白方块且不可见，则入栈
                if (map->blocks[row - 1][column].type == BLOCK_TYPE_BLANK && map->blocks[row - 1][column].status != BLOCK_STATUS_VISIBLE) {
                    stack_top_index++;
                    stack[stack_top_index].row = row - 1;
                    stack[stack_top_index].column = column;
                }
                // 将正上方方块设置为可见
                map->blocks[row - 1][column].status = BLOCK_STATUS_VISIBLE;

                // 若右列存在
                if (column + 1 < map->number_of_columns) {
                    // 若右上方为空白方块且不可见，则入栈
                    if (map->blocks[row - 1][column + 1].type == BLOCK_TYPE_BLANK && map->blocks[row - 1][column + 1].status != BLOCK_STATUS_VISIBLE) {
                        stack_top_index++;
                        stack[stack_top_index].row = row - 1;
                        stack[stack_top_index].column = column + 1;
                    }
                    // 将右上方方块设置为可见
                    map->blocks[row - 1][column + 1].status = BLOCK_STATUS_VISIBLE;
                }
            }

            // 若左列存在
            if (column - 1 >= 0) {
                // 若正左方为空白方块且不可见，则入栈
                if (map->blocks[row][column - 1].type == BLOCK_TYPE_BLANK && map->blocks[row][column - 1].status != BLOCK_STATUS_VISIBLE) {
                    stack_top_index++;
                    stack[stack_top_index].row = row;
                    stack[stack_top_index].column = column - 1;
                }
                // 将正左方方块设置为可见
                map->blocks[row][column - 1].status = BLOCK_STATUS_VISIBLE;
            }

            // 若右列存在
            if (column + 1 < map->number_of_columns) {
                // 若正右方为空白方块且不可见，则入栈
                if (map->blocks[row][column + 1].type == BLOCK_TYPE_BLANK && map->blocks[row][column + 1].status != BLOCK_STATUS_VISIBLE) {
                    stack_top_index++;
                    stack[stack_top_index].row = row;
                    stack[stack_top_index].column = column + 1;
                }
                // 将正右方方块设置为可见
                map->blocks[row][column + 1].status = BLOCK_STATUS_VISIBLE;
            }

            // 若下一行存在
            if (row + 1 < map->number_of_rows) {
                // 若左列存在
                if (column - 1 >= 0) {
                    // 若左下方为空白方块且不可见，则入栈
                    if (map->blocks[row + 1][column - 1].type == BLOCK_TYPE_BLANK && map->blocks[row + 1][column - 1].status != BLOCK_STATUS_VISIBLE) {
                        stack_top_index++;
                        stack[stack_top_index].row = row + 1;
                        stack[stack_top_index].column = column - 1;
                    }
                    // 将左下方方块设置为可见
                    map->blocks[row + 1][column - 1].status = BLOCK_STATUS_VISIBLE;
                }

                // 若正下方为空白方块且不可见，则入栈
                if (map->blocks[row + 1][column].type == BLOCK_TYPE_BLANK && map->blocks[row + 1][column].status != BLOCK_STATUS_VISIBLE) {
                    stack_top_index++;
                    stack[stack_top_index].row = row + 1;
                    stack[stack_top_index].column = column;
                }
                // 将正下方方块设置为可见
                map->blocks[row + 1][column].status = BLOCK_STATUS_VISIBLE;

                // 若右列存在
                if (column + 1 < map->number_of_columns) {
                    // 若右下方为空白方块且不可见，则入栈
                    if (map->blocks[row + 1][column + 1].type == BLOCK_TYPE_BLANK && map->blocks[row + 1][column + 1].status != BLOCK_STATUS_VISIBLE) {
                        stack_top_index++;
                        stack[stack_top_index].row = row + 1;
                        stack[stack_top_index].column = column + 1;
                    }
                    // 将右下方方块设置为可见
                    map->blocks[row + 1][column + 1].status = BLOCK_STATUS_VISIBLE;
                }
            }
        }

        // 释放栈的内存
        free(stack);
    }

    /*
     * 重新计算各统计数据
     */

    // 重置统计数据
    map->number_of_visible_blocks = 0;
    map->number_of_flags = 0;
    map->number_of_doubts = 0;
    map->number_of_visible_mine_blocks = 0;
    // 遍历方块表，计算统计数据
    for (row = 0; row < map->number_of_rows; row++) {
        for (column = 0; column < map->number_of_columns; column++) {
            if (map->blocks[row][column].status == BLOCK_STATUS_VISIBLE) {
                map->number_of_visible_blocks++;

                if (map->blocks[row][column].type == BLOCK_TYPE_MINE) {
                    map->number_of_visible_mine_blocks++;
                }
            }
            if (map->blocks[row][column].status == BLOCK_STATUS_FLAG) {
                map->number_of_flags++;
            }
            if (map->blocks[row][column].status == BLOCK_STATUS_DOUBT) {
                map->number_of_doubts++;
            }
        }
    }
    // 计算不可见方块数
    map->number_of_invisible_blocks = map->number_of_blocks - map->number_of_visible_blocks;

    return 1;
}

/**
 * 游戏开始界面
 *
 * @param game              游戏指针
 */
void GameStartScreen(Game *game) {
    // 行数
    int rows;
    // 列数
    int columns;
    // 地雷数
    int mines;
    // 难度
    GameDifficulty difficulty;
    // 最小数
    int min;
    // 最大数
    int max;
    // 输入是否正确
    _Bool is_valid;

    // 清空控制台
    system("cls");

    // 设置控制台的主题名称
    SetConsoleTitle(mines_title);

    // 输出难度信息

    printf(SUBTITLE_STYLE);
    printf("[ 难度 ]\n");
    printf(CLEAR_STYLE);

    printf("\n");

    printf("    %d. 初级（ 9行 x  9列，10个地雷）\n", GAME_DIFFICULTY_LOW);
    printf("    %d. 中级（16行 x 16列，40个地雷）\n", GAME_DIFFICULTY_MIDDLE);
    printf("    %d. 高级（16行 x 30列，99个地雷）\n", GAME_DIFFICULTY_HIGH);
    printf("    %d. 自定义\n", GAME_DIFFICULTY_CUSTOMIZED);

    printf("\n");

    printf(SEPARATOR);

    // 选择难度
    do {
        printf(INPUT_PROMPT_STYLE);
        printf("请选择难度：");
        printf(CLEAR_STYLE);

        printf(INPUT_STYLE);
        scanf("%d", (int *)&difficulty);
        printf(CLEAR_STYLE);

        is_valid = difficulty >= GAME_DIFFICULTY_CUSTOMIZED && difficulty <= GAME_DIFFICULTY_HIGH;

        if (! is_valid) {
            printf(ERROR_MESSAGE_STYLE);
            printf("请输入正确的编号！\n");
            printf(CLEAR_STYLE);
        }
    } while (! is_valid);

    // 确定行数、列数和地雷数
    // 低级难度
    if (difficulty == GAME_DIFFICULTY_LOW) {
        rows = 9;
        columns = 9;
        mines = 10;
    }
    // 中级难度
    else if (difficulty == GAME_DIFFICULTY_MIDDLE) {
        rows = 16;
        columns = 16;
        mines = 40;
    }
    // 高级难度
    else if (difficulty == GAME_DIFFICULTY_HIGH) {
        rows = 16;
        columns = 30;
        mines = 99;
    }
    // 自定义难度
    else {
        // 输入行数
        do {
            printf(INPUT_PROMPT_STYLE);
            printf("行数：");
            printf(CLEAR_STYLE);

            printf(INPUT_STYLE);
            scanf("%d", &rows);
            printf(CLEAR_STYLE);

            min = 2;
            max = INT_MAX;
            is_valid = rows >= min && rows <= max;

            if (! is_valid) {
                printf(ERROR_MESSAGE_STYLE);
                printf("行数范围：%d ~ %d！\n", min, max);
                printf(CLEAR_STYLE);
            }
        } while (! is_valid);

        // 输入列数
        do {
            printf(INPUT_PROMPT_STYLE);
            printf("列数：");
            printf(CLEAR_STYLE);

            printf(INPUT_STYLE);
            scanf("%d", &columns);
            printf(CLEAR_STYLE);

            min = 2;
            max = INT_MAX;
            is_valid = columns >= min && columns <= max;

            if (! is_valid) {
                printf(ERROR_MESSAGE_STYLE);
                printf("列数范围：%d ~ %d！\n", min, max);
                printf(CLEAR_STYLE);
            }
        } while (! is_valid);

        // 输入地雷数
        do {
            printf(INPUT_PROMPT_STYLE);
            printf("地雷数：");
            printf(CLEAR_STYLE);

            printf(INPUT_STYLE);
            scanf("%d", &mines);
            printf(CLEAR_STYLE);

            // 合格条件：地雷数≥1，地雷比率≥5%，且≤90%
            min = (int)(rows * columns * 0.05) >= 1 ? (int)(rows * columns * 0.05) : 1;
            max = (int)(rows * columns * 0.90) >= 1 ? (int)(rows * columns * 0.90) : 1;
            is_valid = mines >= min && mines <= max;

            if (! is_valid) {
                printf(ERROR_MESSAGE_STYLE);
                printf("地雷数范围：%d ~ %d！\n", min, max);
                printf(CLEAR_STYLE);
            }
        } while (! is_valid);
    }

    // 创建地图
    game->map = CreateMap(rows, columns, mines);

    UINT nRet = MessageBox(0, "请仔细阅读游戏操作说明并准备开始扫雷 ^_^！", "提示", MB_OKCANCEL | MB_ICONERROR);
    if(nRet == IDOK){
        GameHelp();
        system("pause");
    }else {
        exit(0);
    }
}

/**
 * 游戏过程界面
 *
 * @param game              游戏指针
 */
void GameProcessScreen(Game *game) {
    // 行编号
    int row;
    // 列编号
    int column;
    // 操作指令
    char directive[100];
    // 方块目标状态
    BlockStatus status;
    // 输入是否正确
    _Bool is_valid;

    // 当游戏未结束时一直执行
    while (! game->is_finished) {
        // 换行，解决输入多个命令行时上一个界面的输入提示挤占本次界面顶部的问题
        printf("\n\n");
        // 清空控制台
        system("cls");

        // 打印地图
        PrintMap(game->map);

        printf("\n\n");
        GameInfo(game); // 打印游戏的统计信息

        // 获取扫雷指令
        printf(INPUT_PROMPT_STYLE);
        printf("命令行：");
        printf(CLEAR_STYLE);

        printf(INPUT_STYLE);
        rewind(stdin);
        scanf("%d%d%s", &row, &column, directive);  // 这里可以被 Hook
        if(strlen(directive) > 100 || row > game->map->number_of_rows || column > game->map->number_of_columns){
            puts("\n");
            GameHelp(game);

            if(MessageBox(0, "请输入正确的命令行！", "提示", 1))
                continue;
        }

        if (strcmp(directive, "V") == 0 || strcmp(directive, "v") == 0) {
            is_valid = 1;
            status = BLOCK_STATUS_VISIBLE;
        } else if (strcmp(directive, "F") == 0 || strcmp(directive, "f") == 0) {
            is_valid = 1;
            status = BLOCK_STATUS_FLAG;
        } else if (strcmp(directive, "?") == 0) {
            is_valid = 1;
            status = BLOCK_STATUS_DOUBT;
        } else if (strcmp(directive, "C") == 0 || strcmp(directive, "c") == 0) {
            is_valid = 1;
            status = BLOCK_STATUS_INVISIBLE;
        } else {
            is_valid = 0;
        }

        if (! is_valid) {
            puts("\n");
            GameHelp(game);

            if(MessageBox(0, "请输入正确的命令行！", "提示", 1))
                continue;
        }

        // 处理方块
        HandleBlock(game->map, row - 1, column - 1, status);

        // 计算游戏结果信息
        // 如果剩余不可见方块数等于地雷数，则全部雷都被排出来了，即胜利
        game->is_winning = game->map->number_of_invisible_blocks == game->map->number_of_mines;
        // 如果输了或赢了，则游戏结束
        game->is_finished =
                // 可见地雷数＞0 => 点到雷了 => 输
                game->map->number_of_visible_mine_blocks > 0
                // 或，胜利
                || game->is_winning;
    }
}

/**
 * 游戏结束界面
 *
 * @param game              游戏指针
 */
void GameEndScreen(Game *game) {
    // 清空控制台
    system("cls");

    // 输出结果信息

    if (game->is_winning) {
        printf("                       ");
        printf(VICTORY_STYLE);
        printf("恭喜，您已扫出所有地雷，游戏胜利！\n");
        printf(CLEAR_STYLE);
    } else {
        printf("                        ");
        printf(DEFEAT_STYLE);
        printf("很遗憾，您踩到了地雷，游戏失败！\n");
        printf(CLEAR_STYLE);
    }

    printf("\n");

    printf(SEPARATOR);

    printf("\n");

    PrintMap(game->map);

    printf("\n\n");
}

void GameInfo(Game *game){
    // 打印统计信息
    printf(SUBTITLE_STYLE);
    printf("[ 统计信息 ]\n");
    printf(CLEAR_STYLE);

    printf("    ");

    printf("行数: ");
    printf(HIGHLIGHT_STYLE);
    printf("%-13d", game->map->number_of_rows);
    printf(CLEAR_STYLE);

    printf("列数: ");
    printf(HIGHLIGHT_STYLE);
    printf("%-13d", game->map->number_of_columns);
    printf(CLEAR_STYLE);

    printf("方块总数: ");
    printf(HIGHLIGHT_STYLE);
    printf("%-9d", game->map->number_of_blocks);
    printf(CLEAR_STYLE);

    printf("地雷数: ");
    printf(HIGHLIGHT_STYLE);
    printf("%-11d", game->map->number_of_mines);
    printf(CLEAR_STYLE);

    printf("\n");
    printf("    ");

    printf("已翻开方块数: ");
    printf(HIGHLIGHT_STYLE);
    printf("%-5d", game->map->number_of_visible_blocks);
    printf(CLEAR_STYLE);

    printf("未翻开方块数: ");
    printf(HIGHLIGHT_STYLE);
    printf("%-5d", game->map->number_of_invisible_blocks);
    printf(CLEAR_STYLE);

    printf("旗标数: ");
    printf(HIGHLIGHT_STYLE);
    printf("%-11d", game->map->number_of_flags);
    printf(CLEAR_STYLE);

    printf("疑问标数: ");
    printf(HIGHLIGHT_STYLE);
    printf("%-9d", game->map->number_of_doubts);
    printf(CLEAR_STYLE);

    printf("\n\n");
}

void GameHelp(){
    // 打印操作方法
    printf(SUBTITLE_STYLE);
    printf("[ 操作说明 ]\n");
    printf(CLEAR_STYLE);

    printf("    命令行格式：\n");

    printf("        ");
    printf(HIGHLIGHT_STYLE);
    printf("行编号 列编号 方块操作指令, 如 6 8 v 等\n");
    printf(CLEAR_STYLE);

    printf("    方块操作指令：\n");

    printf("        ");
    printf(HIGHLIGHT_STYLE);
    printf("V");
    printf(CLEAR_STYLE);
    printf(": 将一个未翻开的方块翻开\n");

    printf("        ");
    printf(HIGHLIGHT_STYLE);
    printf("F");
    printf(CLEAR_STYLE);
    printf(": 对一个未翻开的方块设置小旗标记，表示此处确定有地雷\n");

    printf("        ");
    printf(HIGHLIGHT_STYLE);
    printf("?");
    printf(CLEAR_STYLE);
    printf(": 对一个未翻开的方块设置疑问标记，表示此处可能有地雷\n");

    printf("        ");
    printf(HIGHLIGHT_STYLE);
    printf("C");
    printf(CLEAR_STYLE);
    printf(": 清除一个未翻开的方块上的任何标记\n");
}
