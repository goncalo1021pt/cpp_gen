NAME = teste cpp_gen 

SRCS = $(wildcard srcs/*.cpp)

RM = rm -f
CXXFLAGS = -Wall -Wextra -Werror -std=c++98
SFLAGS = -fsanitize=address
CXX = c++
INCLUDES = -I includes
HDRS = $(wildcard includes/*.hpp includes/*.h)
OBJS = $(addprefix $(OBJS_DIR)/,$(SRCS:srcs/%.cpp=%.o))
SOBJS = $(addprefix $(OBJS_DIR_S)/,$(SRCS:srcs/%.cpp=%.o))

OBJS_DIR = objs
OBJS_DIR_S = s_objs

# Color codes
GREEN = \033[0;32m
RED = \033[0;31m
BLUE = \033[0;34m 
ORANGE = \033[0;33m
NC = \033[0m 

all: $(NAME)

$(OBJS_DIR)/%.o: srcs/%.cpp $(HDRS)
	@mkdir -p $(dir $@)
	@$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

$(OBJS_DIR_S)/%.o: srcs/%.cpp $(HDRS)
	@mkdir -p $(dir $@)
	@$(CXX) $(CXXFLAGS) $(SFLAGS) $(INCLUDES) -c $< -o $@

$(NAME): $(OBJS)
	@echo "$(GREEN)$(NAME)$(NC) compiling..."
	@$(CXX) $(CXXFLAGS) -o $(NAME) $(OBJS) $(INCLUDES)
	@echo "$(GREEN)$(NAME)$(NC) ready!"

s: fclean $(SOBJS)
	@echo "$(GREEN)$(NAME)$(NC) compiling..."
	@$(CXX) $(CXXFLAGS) $(SFLAGS) -o $(NAME) $(SOBJS) 
	@echo "$(GREEN)$(NAME)$(NC) ready!"

clean:
	@$(RM) -r $(OBJS_DIR)
	@$(RM) -r $(OBJS_DIR_S)
	@echo "$(RED)$(NAME)$(NC)OBJS cleaned!"

fclean: clean
	@$(RM) $(NAME)
	@$(RM) $(BONUS_NAME)
	@echo "$(RED)$(NAME)$(NC)cleaned!"

v: 
	make re && valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --track-fds=yes ./$(NAME)

fcount:
	@echo "you wrote $(RED)$(shell cat $(SRCS) | wc -l)$(NC)lines of code"

send:
	@git add . && git commit -m "auto" && git push

run: all
	./$(NAME) 

re: fclean all

.PHONY: all fclean clean re v s fcount send run
