/**
 * ----------------------------------------------------------------------------
 * [头文件] 游戏
 * ----------------------------------------------------------------------------
 *
 * 定义扫雷游戏的数据结构和函数原型
 *
 */


#ifndef MINES_H
#define MINES_H

/*
 * 宏定义
 */

// 控制台宽度
#define CONSOLE_WIDTH 80

// 标题样式
#define TITLE_STYLE           "\033[47;30;01m"
// 副标题样式
#define SUBTITLE_STYLE        "\033[47;30m"
// 输入提示样式
#define INPUT_PROMPT_STYLE    "\033[32m"
// 输入样式
#define INPUT_STYLE           "\033[32;01m"
// 错误消息样式
#define ERROR_MESSAGE_STYLE   "\033[31m"
// 强调样式
#define HIGHLIGHT_STYLE       "\033[33;01m"
// 胜利样式
#define VICTORY_STYLE         "\033[32;01;05m\a\a\a"
// 失败样式
#define DEFEAT_STYLE          "\033[31;01;05m\a"
// 方块表样式
#define BLOCK_TABLE_STYLE     ""
// 不可见方块样式
#define INVISIBLE_BLOCK_STYLE "\033[44;01m"
// 旗标方块样式
#define FLAG_BLOCK_STYLE      "\033[44;37;01m"
// 疑问标方块样式
#define DOUBT_BLOCK_STYLE     "\033[44;37;01m"
// 数字方块样式
#define NUMBER_BLOCK_STYLE    "\033[34;01m"
// 地雷方块样式
#define MINE_BLOCK_STYLE      "\033[41;37;01m"
// 清除样式
#define CLEAR_STYLE           "\033[0m"

// 分隔线
#define SEPARATOR             "\033[4m                                                                                \033[0m\n\n"

/*
 * 数据结构定义
 */

// 枚举：游戏难度
typedef enum {
    // 自定义
    GAME_DIFFICULTY_CUSTOMIZED,
    // 低级
    GAME_DIFFICULTY_LOW,
    // 中级
    GAME_DIFFICULTY_MIDDLE,
    // 高级
    GAME_DIFFICULTY_HIGH,
} GameDifficulty;

// 枚举：方块类型
typedef enum {
    // 空白
    BLOCK_TYPE_BLANK,
    // 数字1 ~ 8
    BLOCK_TYPE_NUMBER_1,
    BLOCK_TYPE_NUMBER_2,
    BLOCK_TYPE_NUMBER_3,
    BLOCK_TYPE_NUMBER_4,
    BLOCK_TYPE_NUMBER_5,
    BLOCK_TYPE_NUMBER_6,
    BLOCK_TYPE_NUMBER_7,
    BLOCK_TYPE_NUMBER_8,
    // 地雷
    BLOCK_TYPE_MINE,
} BlockType;

// 枚举：方块状态
typedef enum {
    // 不可见
    BLOCK_STATUS_INVISIBLE,
    // 不可见 + 旗标
    BLOCK_STATUS_FLAG,
    // 不可见 + 疑问标
    BLOCK_STATUS_DOUBT,
    // 可见
    BLOCK_STATUS_VISIBLE,
} BlockStatus;

// 结构体：方块
typedef struct {
    // 类型
    BlockType type;
    // 状态
    BlockStatus status;
} Block;

// 结构体：地图
typedef struct {
    // 行数
    int number_of_rows;
    // 列数
    int number_of_columns;
    // 地雷数
    int number_of_mines;
    // 方块总数
    int number_of_blocks;
    // 可见方块数
    int number_of_visible_blocks;
    // 不可见方块数
    int number_of_invisible_blocks;
    // 旗标数
    int number_of_flags;
    // 疑问标数
    int number_of_doubts;
    // 可见地雷数
    int number_of_visible_mine_blocks;
    // 方块表
    Block **blocks;
} Map;

// 结构体：游戏
typedef struct {
    // 是否结束
    _Bool is_finished;
    // 是否胜利
    _Bool is_winning;
    // 地图
    Map *map;
} Game;

/*
 * 函数原型
 */

// 创建一个游戏
Game * CreateGame();
// 销毁游戏
void DestroyGame(Game **game);
// 初始化游戏
void InitializeGame(Game *game);
// 创建地图
Map * CreateMap(int rows, int columns, int mines);
// 销毁地图
void DestroyMap(Map **map);
// 初始化地图
void InitializeMap(Map *map, int rows, int columns, int mines);
// 清空方块表
void ClearBlockTable(Block **blocks, int rows, int columns);
// 随机散布地雷
void RandomDistributeMines(Map *map);
// 打印地图
void PrintMap(Map *map);
// 处理一个方块
_Bool HandleBlock(Map *map, int row, int column, BlockStatus status);
// 游戏开始界面
void GameStartScreen(Game *game);
// 游戏过程界面
void GameProcessScreen(Game *game);
// 游戏结束界面
void GameEndScreen(Game *game);
// 打印统计信息
void GameInfo(Game *game);
// 打印操作帮助信息
void GameHelp();

#endif //MINES_H
