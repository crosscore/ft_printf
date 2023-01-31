/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strrchr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ysakahar <ysakahar@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/18 15:23:16 by ysakahar          #+#    #+#             */
/*   Updated: 2023/01/18 15:23:16 by ysakahar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strrchr(const char *s, int c)
{
	const char	*last_char;
	size_t		s_len;

	s_len = ft_strlen(s);
	last_char = NULL;
	while (s_len != 0)
	{
		if (*s == (char)c)
			last_char = s;
		s++;
		s_len--;
	}
	if (last_char != NULL)
		return ((char *)last_char);
	else if (c == '\0')
		return ((char *)s);
	else
		return (NULL);
}
