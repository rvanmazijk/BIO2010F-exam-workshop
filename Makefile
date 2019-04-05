RENDER_PDF = Rscript -e "\
	library(rmarkdown);\
	render('$<', 'pdf_document')"

RENDER_GFM = Rscript -e "\
	library(rmarkdown);\
	render('$<', 'github_document')"


all: SAMPLE_QUE README

SAMPLE_QUE: sample_questions_2019_rvm.pdf

README: README.md README.pdf

sample_questions_2019_rvm.pdf: sample_questions_2019_rvm.Rmd question-1-b-figure.png
	$(RENDER_PDF)

README.md: README.Rmd
	$(RENDER_GFM)

README.pdf: README.Rmd
	$(RENDER_GFM)
