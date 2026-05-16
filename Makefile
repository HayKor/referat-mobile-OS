SRC_PREFIX = src/
RES_DIR    = res/
BUILD_DIR  = build/

TYPST_MAIN   = $(SRC_PREFIX)index.typ
TYPST_REPORT = $(SRC_PREFIX)report.typ
BIB_FILE     = $(SRC_PREFIX)ref/refs.bib

TITLE_PAGE = $(RES_DIR)title.pdf
TEMP_PDF   = $(BUILD_DIR)index.pdf

SLIDES             = Багинян_А_В_доклад
SLIDES_PPTX        = $(SLIDES).pptx
SLIDES_PDF         = $(BUILD_DIR)$(SLIDES).pdf
SLIDES_HANDOUT_PDF = $(BUILD_DIR)slides_handout.pdf

REPORT_PDF = Приложение_А_доклад.pdf
OUTPUT_PDF = Багинян_А_В_реферат_Мобильные_ОС.pdf

.PHONY: clean watch all

all: $(OUTPUT_PDF) $(REPORT_PDF)

$(TEMP_PDF): $(TYPST_MAIN) $(BIB_FILE) $(SRC_PREFIX)include/*.typ $(SRC_PREFIX)chapters/*.typ 
	typst compile $(TYPST_MAIN) $(TEMP_PDF)

$(OUTPUT_PDF): $(TEMP_PDF) $(REPORT_PDF) $(SLIDES_HANDOUT_PDF)
	qpdf $(TEMP_PDF) \
	     --pages $(TITLE_PAGE) 1 \
	             $(TEMP_PDF) 1-z \
							 $(SLIDES_HANDOUT_PDF) 1-z \
	     -- $(OUTPUT_PDF)

$(REPORT_PDF): $(TYPST_REPORT)
	typst compile $(TYPST_REPORT) $(REPORT_PDF)

$(SLIDES_PDF): $(SLIDES_PPTX)
	libreoffice --headless --convert-to pdf --outdir $(BUILD_DIR) $(SLIDES_PPTX)

$(SLIDES_HANDOUT_PDF): $(SLIDES_PDF)
	pdfjam --nup 1x3 --frame true --delta "0 5mm" \
	       --outfile $(SLIDES_HANDOUT_PDF) $(SLIDES_PDF)

clean:
	rm -f $(TEMP_PDF) $(OUTPUT_PDF)

watch:
	typst watch $(TYPST_MAIN) $(TEMP_PDF)
