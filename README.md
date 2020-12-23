# final_project-chongxiaoxuan
final_project-chongxiaoxuan created by GitHub Classroom

# *Project 17* 將使用者輸入的自然數(N)以 N * N 的方式由數字 1 從最中間順時鐘往外依序寫下
以下是一個5x5的矩陣：
```
  21 22 23 24 25
  20  7  8  9 10
  19  6  1  2 11
  18  5  4  3 12
  17 16 15 14 13
``` 
**1. clockwiseMatrix(N)**
```
產生一個與上述相似的 N * N 矩陣：
Input : an integer N
Output : a N * N matrix A
example:
>>clockwiseMatrix(5)

做法：
1. 考慮當N = 1時的情況：
  - 當N = 1時，A = 1
2. 依序將數字填入矩陣A內，會發現當N越來越大時，矩陣的內部是沒有改變的，因此可用recursive的方式做出矩陣，分為兩種情況：
       ① 當 N 是偶數時：
       想法：補原矩陣的右，下
       例子：
          7 8 9 |--|
          6 1 2 |  |
          5 4 3 |__|
         |-----|
         |_____|
         
            - 建一個 N * N 的零矩陣 A
            - 再建立一個矩陣 B，作為儲存前N-1項的矩陣
            - 第一個 for 迴圈是要補原矩陣右邊的column
            - 第二個 for 迴圈是要補原矩陣下面的row
        
       ②當 N 是奇數時：
       想法：補矩陣的左，上
       例子：
          |---------------|
          |_______________|
          |--|  7  8  9 10
          |  |  6  1  2 11
          |  |  5  4  3 12
          |__| 16 15 14 13
          
            - 建一個 N * N 的零矩陣 A
            - 再建立一個矩陣 B，作為儲存前N-1項的矩陣
            - 第一個 for 迴圈是要補原矩陣左邊的column
            - 第二個 for 迴圈是要補原矩陣上面的row
3. 顯示矩陣 A 
```
