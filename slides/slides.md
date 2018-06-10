
<h3><a href='https://5xruby.tw' style='color: #da0745 !important;'>五倍紅寶石</a></h3>

## Infas workshop - 用 Ruby on Rails 做一個單字卡系統

by [PastLeo](https://pastleo.me), a little developer at [5xruby](https://5xruby.tw)

---

<table>
  <tr>
    <td>![5xclass3](https://i.imgur.com/3iVNkjY.gif)</td>
    <td>![5xclass4](https://i.imgur.com/0hwH1ph.gif)</td>
  </tr>
  <tr>
    <td>![5xclass1](https://i.imgur.com/0ghQSey.gif)</td>
    <td>![5xclass2](https://i.imgur.com/CKUfdiM.gif)</td>
  </tr>
</table>

---

### 單字卡

![vol notes](https://i.imgur.com/PpWUTM3.jpg)

---

## Ruby on Rails?

---

## Ruby

![ruby](https://i.imgur.com/XjopV7U.png)

#### 高度彈性的程式語言

---

## Rails

![rails](https://i.imgur.com/umXmWGQ.png)

#### [MVC](https://zh.wikipedia.org/wiki/MVC) web framework in Ruby

---

## Today's goal -- 單字卡系統

#### Demo!

---

### 開始吧！

* 透過 Rails 提供的產生器快速建立專案
* 建立抽單字邏輯

---

### 產生一個 Rails 專案

```
rails new word-cards
```

---

### 跑起來看看

```
rails s
```

---

### 建立 Resource


```
rails g scaffold word title answer visited:boolean group
rake db:migrate
```

---

## 今天的起點

#### [https://repl.it/@pastleo/word-cards](https://repl.it/@pastleo/word-cards)

請建立一個 [repl.it](https://repl.it) 帳號，並且 **fork** 成自己的

---

### Word "model"

先玩一下建立好的管理介面

* `title`
* `answer`
* `visited`
* `group`

---

### 抽單字卡的『邏輯』

* `/start/:group`
* `/continue/:group`
* `/answer/:group/:word_id`

---

### `/start/:group`

* 把 group 內所有 word 的 visited 設定成 false

---

### `/continue/:group`

* 從 group 內挑一個的 visited 是 false 的 Word
    * 設定 visited 為 true
    * 顯示 word title
* group 內所有 word 都是 visited 時，轉跳回 word 清單

---

### `/answer/:group/:word_id`

* 顯示 word answer

---

### 準備開始實做

* `/start/:group`
* `/continue/:group`
* `/answer/:group/:word_id`

---

### `/start/:group`

* app/controllers/memorizing_controller.rb
  * start

```ruby
@group = params['group']
words = Word.where(group: @group)
words.update_all(visited: false)
```

---

### `/start/:group`

* app/views/memorizing/start.html.erb

```erb
<%= @group %>
```

---

### `/continue/:group`

* config/routes.rb

```ruby
get '/continue/:group',
  to: 'memorizing#continue',
  as: 'continue'
```

* app/views/memorizing/start.html.erb

```ruby
link_to 'first word',
  continue_path(group: @group)
```

---

### `/continue/:group`

* app/controllers/memorizing_controller.rb
  * continue

```ruby
@word = words.first
@word.visited = true
@word.save
```

---

### `/continue/:group`

* app/views/memorizing/continue.html.erb

```erb
<h1><%= @word.title %></h1>
```

---

### `/answer/:group/:word_id`

* config/routes.rb
* app/views/memorizing/continue.html.erb

```ruby
answer_path(word_id: @word.id)
```

---

### `/answer/:group/:word_id`

* app/controllers/memorizing_controller.rb
  * answer

```ruby
@word = Word.find(word_id)
```

---

### `/answer/:group/:word_id`

* app/views/memorizing/answer.html.erb

---

### 所有 words 都是 visited 的時候

* app/controllers/memorizing_controller.rb
  * continue

```ruby
if @word.present?
  # make the @word visited and save
else
  redirect_to path,
    notice: "memorizing finished!"
end
```

---

## 有基本的抽卡功能囉

#### 如果要加強的話有哪些方向呢？

---

### 隨機抽一個

* app/controllers/memorizing_controller.rb
  * continue

```ruby
@word = words.order("RANDOM()").first
```

---

### FAQ

#### 跟不上怎辦嗚嗚

#### [commit on github](https://github.com/pastleo/infas-ws-word-cards/commit/dce7c95cce6013d76f30788c3ed6ad3a6020b054)

---

### FAQ

#### 所以要怎麼達到『今天的起點』？

* 安裝 [Ruby, Rails](https://railsbook.tw/chapters/02-environment-setup.html) 以及 [Nodejs](https://nodejs.org/en/)

```
rails new word-cards
rails g scaffold word title answer visited:boolean group
rails s
rake db:migrate
```

---

### FAQ

#### 我很有興趣，想學

* [為你自己學 Ruby on Rails](https://railsbook.tw/)
* 週二晚上有空也可以來 [五倍紅寶石](https://5xruby.tw) [默默會](https://www.facebook.com/rubymokumokukai/) 坐坐，認識朋友

---

### FAQ

#### More Questions?

---

### 謝謝大家

本 slides URL: [https://tinyurl.com/y7gswt8b](https://tinyurl.com/y7gswt8b)

by [PastLeo](https://pastleo.me), a little developer at [5xruby](https://5xruby.tw)

