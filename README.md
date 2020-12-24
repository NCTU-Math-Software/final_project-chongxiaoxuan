# final_project-chongxiaoxuan
final_project-chongxiaoxuan created by GitHub Classroom

# *Project 17* 
# 將使用者輸入的自然數(N)以 N * N 的方式由數字 1 從最中間順時鐘往外依序寫下

例子：
     以下是一個5x5的矩陣：
```
               21 22 23 24 25
               20  7  8  9 10
               19  6  1  2 11
               18  5  4  3 12
               17 16 15 14 13
```

>***操作方法：***
```
在我的程式裡，一共有 4 個 .m 檔，但是有一個總的檔案是拿來執行剩下所有的程式：

總檔案： finalProject17.m

各程式的檔案：
     1. clockwiseMatrix.m
     2. sumDiagonal.m
     3. imagePrime.m

在 finalProject17.m 裡會有兩個input arguments，分別是 choice 和 N
choice是讓你選擇想要執行哪一個程式，而 N 則是矩陣的大小

  choice         程式
    1            clockwiseMatrix.m
    2            sumDiagonal.m
    3            imagePrime.m

使用者只需輸入
>> finalProject17(choice,N)
** 其中，在 choice 裡輸入想要執行程式的號碼(1 / 2 / 3)，N 則是 [ 1 , ∞ ) **

Remark：
(I)   依據每個人電腦的大小，則程式可接受的 N 的大小也不一樣，
      當 N 過大時，系統會顯示 " Out of memory. " 的提示字
(II)  每一次程式執行都會顯示一共用了多少時間
(III) 如果 choice = 3 時，則 N 不管輸入什麼都不影響，因為在第三個程式已經有指定的 N

```
>***程式介紹：***

**1. clockwiseMatrix.m**
```
題目要求: 產生一個與上述相似的 N * N 矩陣：

Input : an integer N
Output : a N * N matrix A
example:
>> clockwiseMatrix(6)
>>
   21 22 23 24 25 26
   20  7  8  9 10 27
   19  6  1  2 11 28
   18  5  4  3 12 29
   17 16 15 14 13 30
   36 35 34 33 32 31
  
做法：
1. 考慮當 N = 1 時的情況：
  -> 當 N = 1 時，A = 1
  
2. 依序將數字填入矩陣A 內，會發現當 N 越來越大時，矩陣的內部是沒有改變的，
   因此可用recursive的方式做出矩陣，分為兩種情況：
       ① 當 N 是偶數時：
       ->想法：補原矩陣的右，下
       ->例子：
                 ___
          7 8 9 |   |
          6 1 2 |   |
          5 4 3 |___|
         |----------|
         |__________|
         
            (i)   建一個 N * N 的零矩陣 A
            (ii)  再建立一個矩陣 B，作為儲存前 N - 1 項的矩陣
            (iii) 第一個 for 迴圈是要補原矩陣右邊的 column
            (iv)  第二個 for 迴圈是要補原矩陣下面的 row
        
       ②當 N 是奇數時：
       ->想法：補矩陣的左，上
       ->例子：
          |---------------|
          |_______________|
          |---|  7  8  9 10
          |   |  6  1  2 11
          |   |  5  4  3 12
          |___| 16 15 14 13
          
            (i)   建一個 N * N 的零矩陣 A
            (ii)  再建立一個矩陣 B，作為儲存前 N - 1 項的矩陣
            (iii) 第一個 for 迴圈是要補原矩陣左邊的 column
            (iv)  第二個 for 迴圈是要補原矩陣上面的 row
            
3. 顯示矩陣 A 
```

**2. sumDiagonal.m**
```
題目要求：以不造矩陣的方式，算出 N * N 矩陣的正對角線(a_ii)及反對角線(a_n-i,i)之和：

Input : an integer N
Output : an integer sum
example :
>> sumDiagonal(5)
>> sum = 101

做法：
1. 給 sum 初始值
  sum = 0-rem(N,2)
  ->當 N 是奇數時，1 是矩陣的中心，因此當正對角線及反對角線相加時會重複加到 1，
    所以取 rem(N,2) 是為了避免 1 被重複加
    
2. 用 for 迴圈計算正對角線及反對角線的和
  -> 正對角線
     -不管是奇數還是偶數的情況，它們都符合 (ii*ii-ii+1) 這個通式
  -> 反對角線
     -分為偶數和奇數的情況
        ① 偶數：
          通式： sum = sum + ii * ii + 1
        ② 奇數：
          通式： sum = sum + ii * ii
```

**3. imagePrime.m**
```
題目要求：給定 200 * 200 的矩陣，將所有質數點的位置設為黑色，非質數點的位置設為白色，
         再以 image 的方式顯示此矩陣：

Output : graph of matrix A
example :
>> imagePrime()

做法：
1. 寫一個 function 判斷其是否為質數
   (i)    一開始假定全部都是質數
   (ii)   因為 1 既不是質數，也不是合數，所以要把他排除
   (iii)  將 N 開根號再無條件捨棄小數點的值，把它叫做 t
   (iv)   從 2 開始一直到 t ，如果與 N 相除後有餘數，即為質數，否則是合數
   
2. 指定 N = 200，再把 200 * 200 的矩陣造出(利用在 clockwiseMatrix.m 的程式碼)

3. 將質數的位子變成黑色，其餘的是白色
   (i)    設定色盤 -> 0為黑色 (質數) ; 1 為白色 (合數) 
   (ii)   取用色盤並把矩陣以 image 的方式呈現
   
4. 讓使用者給定一個數字判斷其為質數或合數，並用紅色顯示它在矩陣中的位子
   (i)    使用者輸入想要的數字
   (ii)   跳出小視窗告知使用者他輸入的數字是否為質數
   (iii)  待 1.5 秒再顯示矩陣的樣子 (以 image 呈現)
   (iv)   不管是否為質數，直接改變使用者輸入的數字的位子的顏色(紅色)，並以image顯示
```
