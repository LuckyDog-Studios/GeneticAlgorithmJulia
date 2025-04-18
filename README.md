# KEN1210 Practical Assignment 1 - Genetic Algorithms

<img src="https://imgs.xkcd.com/comics/recipes.png" width=70% height=70%>

## Task

The infinite monkey theorem states that given an infinite time, a bunch of monkeys tapping keys on a typewriter will produce a meaningful text, such as a work of Shakespeare (for more information: http://en.wikipedia.org/wiki/Infinite_monkey_theorem). Here we will test the added value of evolutionary pressure to see if we can reduce the infinite time to something we can see in our lifetime (or even a few minutes). 

<img src="https://upload.wikimedia.org/wikipedia/commons/3/3c/Chimpanzee_seated_at_typewriter.jpg" width=50% height=50%>

You goal is to implement a Genetic Algorithm. The test case in our practical session is not the work of Shakespeare, but something equally important: HELLO WORLD. Write a genetic algorithm that can evolve a population of strings to HELLO WORLD. To get you started, I have provided a few java classes. The program PracticalGA.java contains some code to randomly initialize a population of individuals. The class Individual is a very basic object that provides you with a structure to model your population (you are free to implement your own). 

I also provided a sorting class, called Heapsort.java, which (obviously) performs a Heapsort. The sorting is based on fitness of individuals. The fitness needs to be provided by the getFitness() method of the Individual and one of your important jobs is to properly set the fitness in each Individual in each generation. Heapsort is an inplace sorting, and extremely fast. Inplace sorting means that the array you put into it, is the same array that is returned. Except that individuals will be sorted from highest to lowest fitness value. The individual with the largest fitness value will be found at index 0, with the second highest fitness value at index 1, etc. 

Your program should have at least the following components: 
- A selection method: you are free to choose which
- A crossover method: again, free to choose how complicated
- A mutation method: you can randomly draw a letter of the alphabet array and replace a letter in the chromosome. Keep in mind the mutation rate (the chance of a mutation per individual per generation). 

## Questions
When you have finished your program, play around with it by varying some parameters, and answer the following questions with text and data visualizations: 

1. What is the influence of a larger/smaller population? Do you see a difference in number of generations needed to find a solution?
2. What is the influence of a larger/smaller mutation rate? Do you see a difference in number of generations needed to find a solution?
3. Now leave out the crossover operator. Do you see a difference in number of generations needed to find a solution?
4. Does your GA still work without mutations? Why or why not?
5. Questions 1 – 4 seem to suggest an optimum for this problem. What is it? Would this work for all problems? Why? 

No introduction is needed. Remember that the report can be maximum 4 pages long and is due 18:00 on the Friday after the exam.  

Images from wikipedia.org and xkcd.com 
