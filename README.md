# postgress_A2
## **📂 Bonus Section (Answer Any 5 Questions on readme.md in Bangla) → 10 Marks**


*1. What is PostgreSQL?*
Ans : 
পোস্টগ্রেস (PostgreSQL) একটি শক্তিশালী, জনপ্রিয়, ওপেন সোর্স রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS)। এটি প্রথম তৈরি করা হয় ১৯৮৬ সালে UC Berkeley-এর তত্ত্বাবধানে Michael Stonebraker-এর নেতৃত্বে।
PostgreSQL একটি রিলেশনাল ডাটাবেস হলেও এটি JSON এবং অন্যান্য ফরম্যাটের মাধ্যমে নন-রিলেশনাল ডাটা সংরক্ষণ ও পরিচালনা করার ক্ষমতা রাখে। এজন্য এটিকে একটি অবজেক্ট-রিলেশনাল ডাটাবেস (ORDBMS) বলা হয়।PostgreSQL ডাটাটাইপ তৈরির সময় অবজেক্ট এবং প্রপার্টি সংরক্ষণ করতে পারে, যার মাধ্যমে ইনহেরিটেন্স (Inheritance) এবং পলিমরফিজম (Polymorphism) এর মতো অ্যাডভান্সড ফিচারগুলো সাপোর্ট করে।এছাড়া PostgreSQL বিভিন্ন প্রোগ্রামিং ভাষার সাথে ইন্টিগ্রেট করা যায়, যেমন:Python, Java, C#, C, C++, Ruby, JavaScript (Node.js) ইত্যাদি।
2. What is the purpose of a database schema in PostgreSQL?
ANS : 
*3. Explain the **Primary Key** and **Foreign Key** concepts in PostgreSQL.*
**প্রাইমারি কি (Primary Key):**  
প্রাইমারি কি এমন একটি বা একাধিক কলাম যেগুলোর মাধ্যমে একটি টেবিলের প্রতিটি রেকর্ড (row) কে ইউনিকভাবে শনাক্ত করা যায়।

**প্রাইমারি কি-এর বৈশিষ্ট্য:**
- একটি টেবিলে শুধুমাত্র একটি প্রাইমারি কি থাকতে পারে।
- প্রাইমারি কি ফিল্ডে ডুপ্লিকেট ভ্যালু থাকতে পারে না এবং NULL ভ্যালুও দেওয়া যাবে না।
- প্রাইমারি কি সাধারণত প্রতিটি রেকর্ডের জন্য ইউনিক আইডেন্টিফায়ার হিসেবে কাজ করে।
- প্রাইমারি কি পরিবর্তন করা সম্ভব, তবে যদি তা অন্য টেবিলের ফরেন কি দ্বারা রেফারেন্স করা হয়ে থাকে, তাহলে সংশ্লিষ্ট রিলেশন আপডেট করতে হয় বা ক্যাসকেড অপশন ব্যবহার করতে হয়।

**ফরেন কি (Foreign Key):**  
যখন একটি টেবিলের একটি কলাম অন্য একটি টেবিলের প্রাইমারি কি বা ইউনিক কিকে রেফারেন্স করে, তখন সেই কলামটিকে ফরেন কি বলা হয়। এটি দুটি টেবিলের মধ্যে সম্পর্ক (Relation) তৈরি করতে সাহায্য করে।

**ফরেন কি এর বৈশিষ্ট্য:**
- ফরেন কি অবশ্যই অন্য টেবিলের প্রাইমারি কি অথবা ইউনিক কিকে রেফারেন্স করবে।
- ফরেন কি কলামে ডুপ্লিকেট ভ্যালু থাকতে পারে।
- চাইলে NULL বা ডুপ্লিকেট  ভ্যালুও ইনসার্ট করা যায়। 
- এটি ডেটাবেসে রেফারেনশিয়াল ইন্টিগ্রিটি বজায় রাখতে সাহায্য করে।
4. What is the difference between the `VARCHAR` and `CHAR` data types?
5. Explain the purpose of the `WHERE` clause in a `SELECT` statement.
6. What are the `LIMIT` and `OFFSET` clauses used for?
7. How can you modify data using `UPDATE` statements?
8. What is the significance of the `JOIN` operation, and how does it work in PostgreSQL?
9. Explain the `GROUP BY` clause and its role in aggregation operations.
10. How can you calculate aggregate functions like `COUNT()`, `SUM()`, and `AVG()` in PostgreSQL?