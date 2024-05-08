# Imba V2 implementation for js-framework-benchmark

according to https://github.com/krausest/js-framework-benchmark which have imba version 1.5 implementation at https://github.com/krausest/js-framework-benchmark/blob/master/frameworks/keyed/imba/src/main.imba 


I want to update it's benchmark to imba version 2 so here is the repo

## problem found

1. array.len working on dev mode but not on production mode. this cause that check array lenght silently failed (e.g. buildDatas). I can fix this by always use array.lenght method.

2. **memory leak** this one is major and i cannot fix it yet. On version 1 code when you create 10k row and clear it, you've got memory back
![v1]("./imba1.png")


but on version 2 memory will not reduce even the clear rows code is same ( items = []). This problem is reported in imba.io github issue and discord server.
![v2]("./imba2.png")



Hopefully imba community is active enough to help new comer to fix the problem, i really like the syntax but memory-leak application is a no-go.
