# encoding: utf-8
fail = 1+1
fail = 1- 1
fail = 1 &2
fail = 1*2
fail = 2|3
fail = 1 /1
fail = 1% 1
fail = 1>>   1
fail = 1<< 1
fail = 1^ 1
fail = 1<= 1
fail = 1< 1
fail = 1> 1
fail = 1>= 1
fail = 1<=> 1
fail = 1== 1
fail = 1=== 1
fail = 1=~ 2
fail = 1!= 2
fail = 1!~ 2
fail = 1&& 2
fail = 1|| 2
fail = true ? 2: 3
fail = true ?2 : 3
fail =1
fail %=2
fail /=2
fail -=2
fail+= 2
fail|= 2
fail&= 2
fail>>= 2
fail<<= 2
fail*= 2
fail&&= 2
fail||= 2
fail**= 2
fail = size.reduce(:+)+ 1
fail = size.reduce(:+) +1
fail = good_method(*args)* 4
fail = size ?size.reduce(:*) : 0
