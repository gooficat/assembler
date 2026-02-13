AS := as
LD := ld
ASFLAGS := -I./inc
LDFLAGS := -e main
TARGET := assembler

SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin

EXEC := $(BIN_DIR)/$(TARGET)

SRCS := $(wildcard $(SRC_DIR)/*.s)
OBJS := $(patsubst $(SRC_DIR)/%.s,$(OBJ_DIR)/%.o,$(SRCS))

all: $(EXEC) run

run:
	@./$(EXEC)

$(EXEC): $(OBJS)
	@mkdir -p $(BIN_DIR)
	@$(LD) $(LDFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(OBJ_DIR)
	@$(AS) $(ASFLAGS) -o $@ $<

clean:
	@rm -rf $(OBJ_DIR) $(BIN_DIR)
