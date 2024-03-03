#import "@preview/polylux:0.3.1": *
#import "@preview/tablex:0.0.7": tablex, cellx

// HACK NEEDED for correct emoji PDF output. see 
// https://github.com/typst/typst/issues/144 
// and the workaround 
// https://github.com/polazarus/typst-svg-emoji?tab=readme-ov-file
#import "@local/svg-emoji:0.1.0": setup-emoji
#show: setup-emoji 

#import "metropolispt2.typ": * 
// copied the whole theme over in case we want to modify it

#show: metropolis-theme.with(
  // footer: [Classification]
)
// https://polylux.dev/book/themes/gallery/metropolis.html


#set text(font: "Atkinson Hyperlegible", weight: "light", size: 20pt)



#show "curse": _ => {$frak(c u r s e)$} 

#show "KNN": _ => {$K$+"NN"}

// #show "Wikipedia": name => {h(-0.4em) + box(height: 1.7em,baseline: 0.5em)[#image("pics/wiki.png")] + h(-0.1em) + name}


#show "ISLP": _ => highlight(fill: rgb("E8AE27").darken(10%), text(weight: 400, fill: white, font: "Fira Sans", "ISL")+text(weight: 400, fill: black, font: "Fira Sans", "P"))

// #show math.equation: set text(
//   // font: "Libertinus Math", 
//   size: 21pt)
// #show raw: set text(fill: red.darken(70%))


#set strong(delta: 300)
#set par(justify: true)

#set list(marker: "•")
#show link: set text(fill: blue.darken(20%))

#let myblock-title(
  fill: gradient.linear(blue.darken(50%),blue), 
  text-fill: white,
  body
) = {
  block(
      width: 100%, 
      radius: (top: 1em), 
      outset: 0.5em,
      fill: fill,
      text(weight: "bold", fill: text-fill, body)
  )
}

#let myblock(
  title: "", 
  fill: gradient.linear(yellow.lighten(70%),orange.lighten(80%)), title-fill: gradient.linear(blue.darken(50%),blue), 
  width: 80%,
  body
) = { 
  align(center)[
    #block(
      width: width, 
      breakable: false,
      radius: 1em, 
      outset: 0.5em,
      fill: fill,
      [
        #align(left)[
        #if title != "" {
          [#myblock-title(fill: title-fill, title)] 
          v(0.3em)
        }
        #{body}
      ]
    ]
    )
  ]
}

#let question(title: "", body) = myblock(title: title, fill: gradient.linear(red.lighten(90%),orange.lighten(90%)), title-fill: gradient.linear(red.darken(10%),orange.darken(10%)), width: 95%, body)

#let answer(body) = {[*Answer* ] + text(fill: green.darken(50%), body)}


// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// SLIDES BEGIN NOW !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#title-slide(
  title: "Resampling Methods Exercises",
  subtitle: [Slides on _Introduction to Statistical Learning_, Chapter 5],
  author: [Calvin Khor],
  date: [January 2024],
  // extra: [test]
)

////////////////////
//// EXERCISES!!!!
////////////////////
// #new-section-slide("Exercises")
#let Var = math.op("Var")
#let Cov = math.op("Cov")
#slide[#v(-0.5em)
  #question(title: "Exercise 1 ")[
     Using basic statistical properties of the variance, as well as single- variable calculus, derive (5.6). In other words, prove that $α$ given by (5.6) does indeed minimize $Var(α X + (1 - α)Y )$.
     (5.6) is:
     $
      alpha = (sigma_Y^2 - sigma_(X Y) )/(sigma_X^2 + sigma_Y^2 - 2sigma_(X Y)).
     $
  ]
  #v(-0.3em)
  #uncover(2)[#answer[Simply note that
    $
    Var(alpha X + (1-alpha) Y) 
    // &= alpha^2 Var X + (1-alpha)^2 Var Y + 2 alpha (1-alpha) Cov(X,Y) \
    &= alpha^2 sigma_X^2 + (1-alpha)^2 sigma_Y^2 + 2 alpha (1-alpha) sigma_(X Y)  \
    &= A alpha^2 + B alpha + C \ 
    &= A(alpha + B/(2A))^2 + tilde(C)
    $
    where $A=sigma_X^2 + sigma_Y^2 - 2 sigma_(X Y)$ and $B= - 2 sigma_Y^2 + 2 sigma_(X Y)$, QED. 
]]
]

#slide[
  #question(title: "Exercise 2")[
    We will now derive the probability that a given observation is part of a bootstrap sample. Suppose that we obtain a bootstrap sample from a set of n observations.
#set enum(numbering: "(a)")
+  What is the probability that the first bootstrap observation is not the $j$th observation from the original sample? Justify your answer.
+ What is the probability that the second bootstrap observation is not the $j$th observation from the original sample?
+ Argue that the probability that the $j$th observation is not in the bootstrap sample is $(1 - 1/n)^n$.
  ]
  #uncover(2)[#answer[
    #set enum(numbering: "(a)")
    + $1-1/n$ since the bootstrap observation is uniformly randomly chosen.
    + Its sampling with replacement, so $1-1/n$.
    + $PP(j#"th obs not in boot sample")$ is the product as each bootstrap sample is independent.
  ]]
]

#slide[
  #question(title: "Exercise 2 cont. 1")[
#set enum(numbering: "(a)", start: 4)
+ #set text(size: 19pt); When $n = 5$, what is the probability that the $j$th observation is in the bootstrap sample?
+ #set text(size: 18.5pt); When $n = 100$, what is the probability that the $j$th observation is in the bootstrap sample?
+ #set text(size: 18pt); When $n = 10 thin 000$, what is the probability that the $j$th observation is in the bootstrap sample?
// + Create a plot that displays, for each integer value of $n$ from $1$ to $100,000$, the probability that the $j$th observation is in the bootstrap sample. Comment on what you observe.
// + We will now investigate numerically the probability that a bootstrap sample of size $n = 100$ contains the $j$th observation. Here $j = 4$. We first create an array store with values that will subse- quently be overwritten using the function ```python np.empty()```. We then repeatedly create bootstrap samples, and each time we record whether or not the fifth observation is contained in the bootstrap sample.
// ```python
// rng = np.random.default_rng(10) store = np.empty(10000)
// for i in range(10000):
// store[i] = np.sum(rng.choice(100, replace=True) == 4) >0
// np.mean(store)
// ```
  ]
  #uncover(2)[#answer[

    #set enum(numbering: "(a)", start: 4)
    #let f(n) = [$(1-1/#n)^#n$]
    #let calcf(n) = {calc.pow(1-1/n, n)}
    #let ans(n) = [$#f(n) approx #calcf(n)$.]
    #set enum(numbering: "(a)")
    + #ans(5)
    + #ans(100)
    + #ans(10000)
  ]]
]

#slide[
  #question(title: "Exercise 2 cont. 2")[
#set enum(numbering: "(a)", start: 7)
+ Create a plot that displays, for each integer value of $n$ from $1$ to $100 thin 000$, the probability that the $j$th observation is in the bootstrap sample. Comment on what you observe.
  ]
  #uncover(2)[#answer[

    #set enum(numbering: "(a)", start: 7)
    + #image(width:90%,"pics/ex2.png")
    (see #link("https://www.desmos.com/calculator/tdnzp6lfgb", "Desmos plot").) I observe convergence to $1/e$. Of course, this is because $ (1-1/n)^n = e^(n log(1-1/n)) 
    = e^(n(-1/n - 1/(2n^2) + O(1/n^3)) ) = e^(-1 -1/(2n) + O(1/n^2) ) = 1/e -1/(2 e n) + O(1/n^2). $
  ]]
]
#slide[
  #question(title: "Exercise 2 cont. 3")[
#set enum(numbering: "(a)", start: 8)
+ We will now investigate numerically the probability that a bootstrap sample of size $n = 100$ contains the $j$th observation. Here $j = 4$. We first create an array store with values that will subsequently be overwritten using the function ```python np.empty()```. We then repeatedly create bootstrap samples, and each time we record whether or not the fifth observation is contained in the bootstrap sample.
  #align(center,
```python
rng = np.random.default_rng(10) 
store = np.empty(10000)
for i in range(10000):
    store[i] = np.sum(rng.choice(100, size=100, replace=True) == 4) > 0
np.mean(store)
```)
(NB #link("https://www.statlearning.com/errata-python-edition", "typo corrected")) Comment on the results obtained.
  ]
  #uncover(2)[#answer[
    We get `0.6362`. The bootstrap sample size is $10 thin 000$, so the true probability is $1-#calc.pow(1-0.0001,10000)=#{1-calc.pow(1-0.0001,10000)}$ which is consistent.
  ]]
]

#slide[
  #question(title: "Exercise 3")[
    #set enum(numbering: "(a)")
We now review $k$-fold cross-validation.
+ Explain how $k$-fold cross-validation is implemented.
+ What are the advantages and disadvantages of $k$-fold cross-validation relative to:
   #set enum(numbering: "i.")
  + The validation set approach?
  + LOOCV?
  ]
  #uncover(2)[#answer[
    #set enum(numbering: "(a)")
+ Split the data randomly into $k$ bins. For each bin, train on the other $k-1$ bins and then test on the $k$th bin. Then report the average test error across bins $"CV"_((k)) = 1/k sum_(i=1)^k "MSE"_i$.
+ 
   #set enum(numbering: "i.")
  + *Pros* Helps prevent fitting to the particular split \ 
   *Cons* not repeatable (unless seed fixed), more compute needed
  + *Pros* usually less compute needed, less variance (for small $k$) \ *Cons* not repeatable, higher bias
  ]]
]

#slide[
  #question(title: "Exercise 4")[
     Suppose that we use some statistical learning method to make a prediction for the response $Y$ for a particular value of the predictor $X$. Carefully describe how we might estimate the standard deviation of our prediction.
  ]
  #uncover(2)[#answer[
    We use the bootstrap. First we use our method to make some small number $n$ of predictions $Y_i$. Then we use these to create $N>>n$ bootstrap samples $Y_i^* = (Y_(i 1)^*,...,Y_(i n)^*)$. Finally, our estimate for the standard deviation is the average of the bootstrap standard deviations, 
    $
    sigma_Y approx 1/N sum_(i=1)^N sigma_(Y_i^*) = 1/N sum_(i=1)^N sqrt(1/n sum_(j=1)^n Y_(i j)^(*2) - (1/n sum_(j=1)^n Y_(i j)^*)^2).
    $
  ]]
]