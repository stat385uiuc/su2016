# STAT 385 Course Website

Within this repository, the source code that is behind the [STAT 385 @ UIUC](http://stat385.thecoatlessprofessor.com) Summer 2016 Course Website can be found.

Generally speaking, the website is made using the following tools:

- The backend of the site is powered by [`jekyll`](https://jekyllrb.com/), which enables the static generation of files from [markdown](https://daringfireball.net/projects/markdown/) documents.
- The service that is hosting the website is [GitHub Pages](https://pages.github.com/) via the `gh-pages` branch. 
- To locally preview the website and convert `.Rmd` files to `.md` files, the [`servr`](https://cran.r-project.org/web/packages/servr/index.html) package is employed which provides an interfaces with [`knitr`](https://cran.r-project.org/web/packages/knitr/index.html).
- The display of LaTeX math is done via [MathJax](https://www.mathjax.org/) code snippet that must be enabled within the post front matter with the option `mathjax:true`
- The custom domain name of `stat385.thecoatlessprofessor.com` instead of `username.github.io/repo` is done using the `CNAME` configuration file.

For more information, please refer to a future post on <http://thecoatlessprofessor.com/>.

# Structure

The folder structure of the website is given as:

- Jekyll specific
    - **`_layouts`:** HTML Layout Structure
    - **`_includes`:** HTML Layout Structure
    - **`_posts`:** Contains all posts shown on the website
    - **`_sass`:** Styling for the HTML structure uncompiled
- Course Content
    - **`assets`:** Generation files for HW and Lecture Slides
    - **`.md`:** Top level webpages or repo files.

# License

![The work within this repository is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/).](images/cc.png)