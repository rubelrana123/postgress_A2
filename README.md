<h1>📂  Some Interview Question For postgreSQL</h1>

<hr>

<h3>1️⃣. <strong>What is PostgreSQL?</strong></h3>
<p><strong>উত্তর:</strong><br>
PostgreSQL (পোস্টগ্রেস) একটি শক্তিশালী, ওপেন সোর্স রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS)। এটি প্রথম তৈরি করা হয় ১৯৮৬ সালে UC Berkeley-তে Michael Stonebraker-এর নেতৃত্বে।</p>
<p>PostgreSQL একটি রিলেশনাল ডাটাবেস হলেও, এটি JSON, XML সহ নন-রিলেশনাল ডাটা হ্যান্ডেল করতে পারে, এজন্য এটিকে Object-Relational Database System (ORDBMS) বলা হয়।<br>
এটি বিভিন্ন প্রোগ্রামিং ভাষা যেমন: Python, Java, Node.js, C, C++, C#, Ruby ইত্যাদির সঙ্গে ব্যবহার করা যায়। PostgreSQL ডেটাটাইপ, ইনহেরিটেন্স, পলিমরফিজম, ট্রানজেকশন, কনকারেন্সি কন্ট্রোলের মত অ্যাডভান্সড ফিচার সাপোর্ট করে।
</p>

<h3>2️⃣ <strong>How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?</strong></h3>
<p>  <strong>Aggregate</strong> মানে হচ্ছে পুরো কলাম ধরে হিসেব করা</p>
<h3>  <code>COUNT()</code>কতগুলো রেকর্ড আছে?</h3>
<pre><code>SELECT COUNT(*) FROM orders;
</code></pre>
<p>
<h3><code>SUM()</code>মোট কত?</h3>
<pre><code>SELECT SUM(price) FROM orders;
</code></pre>
<p>
<h3>  <code>AVG()</code> গড় কত?</h3>
<pre><code>SELECT AVG(price) FROM orders;
</code></pre>


<h3>3️⃣  <strong>Explain the Primary Key and Foreign Key concepts in PostgreSQL.</strong></h3>

<p><strong>প্রাইমারি কি (Primary Key):</strong><br>
প্রাইমারি কি হলো একটি বা একাধিক কলাম যা একটি টেবিলের প্রতিটি রেকর্ডকে ইউনিকভাবে শনাক্ত করে।</p>
<ul>
<li>একটি টেবিলে মাত্র একটি প্রাইমারি কি থাকতে পারে।</li>
<li>এটি কখনও NULL বা ডুপ্লিকেট হতে পারে না।</li>
</ul>

<p><strong>ফরেন কি (Foreign Key):</strong><br>
ফরেন কি হলো এমন একটি কলাম যা অন্য একটি টেবিলের প্রাইমারি কি অথবা ইউনিক কিকে রেফারেন্স করে। এটি দুইটি টেবিলের মধ্যে সম্পর্ক তৈরি করে।</p>
<ul>
<li>ফরেন কি অন্য টেবিলের প্রাইমারি/ইউনিক কিকে রেফারেন্স করে।</li>
<li>ফরেন কি ফিল্ডে NULL ও ডুপ্লিকেট ভ্যালু থাকতে পারে।</li>
<li>এটি রেফারেনশিয়াল ইন্টিগ্রিটি বজায় রাখতে সাহায্য করে।</li>
</ul>

<h3>4️⃣ <strong>What is the difference between the VARCHAR and CHAR data types?</strong></h3>

<p><strong>VARCHAR (Variable Character):</strong></p>
<ul>
<li>এটি ভেরিয়েবল-লেংথ ডেটা সংরক্ষণ করে।</li>
<li>VARCHAR(n) হলে সর্বোচ্চ n দৈর্ঘ্যের ডেটা রাখা যায়।</li>
<li>যদি দৈর্ঘ্য কম হয়, তাহলে বাকি স্পেস অপচয় হয় না।</li>
</ul>

<pre><code>CREATE TABLE users (
    name VARCHAR(25),     -- maximum 25 character
    details VARCHAR       -- unlimited character
);
</code></pre>

<p><strong>CHAR (Character):</strong></p>
<ul>
<li>এটি fixed length ডেটা রাখে।</li>
<li>নির্দিষ্ট দৈর্ঘ্যের চেয়ে কম ডেটা হলে, অতিরিক্ত স্পেস দিয়ে পূরণ করে।</li>
</ul>

<pre><code>CREATE TABLE users (
    name CHAR(5)         -- must be 5 character
);
</code></pre>

<h3>5️⃣ <strong>What are the LIMIT and OFFSET clauses used for?</strong></h3>
<p><strong>উত্তর:</strong><br>
<strong>LIMIT:</strong> রো এর লিমিট। মানে কতটা রো আমরা দেখতে চাচ্ছি।<br>
<strong>OFFSET:</strong> রো গুলি কোথা থেকে নির্বাচন করে ফেরত পাঠানো শুরু করতে হবে তা নির্দিষ্ট করতে ব্যবহৃত হয়।
</p>

<p><strong>Example for pagination:</strong></p>
<pre><code>// limit => limitation of row \\ skip or starting row
SELECT * FROM students
LIMIT 5 OFFSET 5 * 0;  -- (5 * 0) = 0 → firstly 5 row

SELECT * FROM students
LIMIT 5 OFFSET 5 * 1;  -- (5 * 1) = 5 → next 5 row

SELECT * FROM students
LIMIT 5 OFFSET 5 * 2;  -- (5 * 2) = 10 → next 5 row
</code></pre>
