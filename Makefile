# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ysakahar <ysakahar@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/25 21:10:01 by ysakahar          #+#    #+#              #
#    Updated: 2023/01/29 04:57:26 by ysakahar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME      = libftprintf.a
CC        = cc
CFLAGS    = -Wall -Wextra -Werror
AR        = ar rcs
RM        = rm -f
INC_DIR   = includes/
SRC_DIR   = srcs/
OBJ_DIR   = objs/
LIBFT_DIR = libft/

RES_COLOR = \033[0;39m
RED       = \033[0;91m
GREEN     = \033[0;92m
YELLOW    = \033[0;93m
BLUE      = \033[0;94m

SRC_FILES = ft_printf \
			ft_print_numstr \
			ft_print_unsigned \
			ft_print_ptr \
			ft_print_hex \

SRCS      = $(addprefix $(SRC_DIR), $(addsuffix .c, $(SRC_FILES)))
OBJS      = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_FILES)))

OBJ_DIR_EXIST = .exist_obj_dir

all: $(NAME)

$(NAME): $(OBJS)
			make -C $(LIBFT_DIR)
			cp $(LIBFT_DIR)libft.a .
			mv libft.a $(NAME)
			$(AR) $(NAME) $(OBJS)
			echo "$(GREEN)ft_printf Compiled!$(RES_COLOR)"

$(OBJ_DIR_EXIST):
			mkdir -p $(OBJ_DIR)

$(OBJ_DIR)%.o: $(SRC_DIR)%.c | $(OBJ_DIR_EXIST)
			echo "$(YELLOW)Compiling: $< -> $@ $(RES_COLOR)"
			$(CC) $(CFLAGS) -I $(INC_DIR) -I $(LIBFT_DIR) -c -o $@ $<

print: $(SRCS)
			echo $(SRCS)

clean:
			$(RM) -r $(OBJ_DIR)
			make clean -C $(LIBFT_DIR)
			echo "$(BLUE)Object files cleaned!$(RES_COLOR)"

fclean: clean
			$(RM) $(NAME)
			$(RM) $(LIBFT_DIR)libft.a
			echo "$(BLUE)Executable files cleaned!$(RES_COLOR)"

re: fclean all

norm:
			norminette -R ForbiddenSourceHeader $(SRC_DIR) $(INC_DIR) $(LIBFT_DIR)

.PHONY: all print clean fclean re norm