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
>>
  21 22 23 24 25
  20  7  8  9 10
  19  6  1  2 11
  18  5  4  3 12
  17 16 15 14 13

做法：
1. 考慮當 N = 1 時的情況：
  -> 當 N = 1 時，A = 1
2. 依序將數字填入矩陣A 內，會發現當 N 越來越大時，矩陣的內部是沒有改變的，
   因此可用recursive的方式做出矩陣，分為兩種情況：
       ① 當 N 是偶數時：
       ->想法：補原矩陣的右，下
       ->例子：
          7 8 9 |--|
          6 1 2 |  |
          5 4 3 |__|
         |-----|
         |_____|
         
            (i)   建一個 N * N 的零矩陣 A
            (ii)  再建立一個矩陣 B，作為儲存前 N - 1 項的矩陣
            (iii) 第一個 for 迴圈是要補原矩陣右邊的 column
            (iv)  第二個 for 迴圈是要補原矩陣下面的 row
        
       ②當 N 是奇數時：
       ->想法：補矩陣的左，上
       ->例子：
          |---------------|
          |_______________|
          |--|  7  8  9 10
          |  |  6  1  2 11
          |  |  5  4  3 12
          |__| 16 15 14 13
          
            (i)   建一個 N * N 的零矩陣 A
            (ii)  再建立一個矩陣 B，作為儲存前 N - 1 項的矩陣
            (iii) 第一個 for 迴圈是要補原矩陣左邊的 column
            (iv)  第二個 for 迴圈是要補原矩陣上面的 row
3. 顯示矩陣 A 
```

**2.sumDiagonal(N)**
```
以不造矩陣的方式，算出 N * N 矩陣的對角線(a_ii)及反對角線(a_n-i,i)之和：

Input : an integer N
Output : sum, an integer
example :
>> sumDiagonal(5)
>> sum = 101

做法：
1. 給 sum 初始值
  sum = 0-rem(N,2)
  ->當 N 是奇數時，1 是矩陣的中心，當對角線及反對角線相加時會重複加到 1，
    因此取 rem(N,2) 是為了避免 1 被重複加
2. 用 for 迴圈計算對角線及反對角線的和
  -> 對角線
     -不管是奇數還是偶數的情況，它們都符合 (ii*ii-ii+1) 這個通式
  -> 反對角線
     -分為偶數和奇數的情況
        ① 偶數：
          通式： sum = sum + ii * ii + 1
        ② 奇數：
          通式： sum = sum + ii * ii
```

**3. imagePrime()**
```
給定 200 * 200 的矩陣，將所有質數點的位置設為黑色，非質數點的位置設為白色，
再以 image 的方式顯示此矩陣：

Output : graph of matrix A
example :
>>imagePrime()

做法：
1. 寫一個 function 判斷其是否為質數
   (i) 一開始假定全部都是質數
   (ii) 因為 1 既不是質數，也不是合數，所以要把他排除
```
