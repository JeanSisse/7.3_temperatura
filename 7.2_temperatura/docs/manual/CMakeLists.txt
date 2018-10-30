  # =====================================
  # RUN LATEX
  # =====================================
  # from http://baptiste-wicht.com/posts/2012/09/cmake-compile-latex-documents.html
  SET(LATEX_OUTPUT_PATH ${PROJECT_BINARY_DIR}/docs/manual)
  SET(EXCLUDE_FROM_ALL TRUE)
  # from http://www.cmake.org/Wiki/CMakeUserUseLATEX
  INCLUDE(UseLATEX.cmake)
  
  file(GLOB_RECURSE contents_files RELATIVE ${CMAKE_CURRENT_LIST_DIR} *.tex)
  
  ## amory:  bug !!! as figuras nao estao sendo encontradas
  ADD_LATEX_DOCUMENT(
      main.tex
      INPUTS ${contents_files}
      IMAGE_DIRS figs/
      BIBFILES sample.bib
      USE_INDEX
      #USE_GLOSSARY
      #FILTER_OUTPUT
      FORCE_PDF
      )
