SRC_PREFIX = src/
RES_DIR = res/
TYPST_MAIN = $(SRC_PREFIX)index.typ
BIB_FILE = $(SRC_PREFIX)ref/refs.bib
TITLE_PAGE = $(RES_DIR)title.pdf
TEMP_PDF = build/index.pdf
OUTPUT_PDF = Багинян_А_В_реферат_Мобильные_ОС.pdf

.PHONY: clean watch all

all: $(OUTPUT_PDF)

$(TEMP_PDF): $(TYPST_MAIN) $(BIB_FILE) $(SRC_PREFIX)include/*.typ $(SRC_PREFIX)chapters/*.typ
	typst compile $(TYPST_MAIN) $(TEMP_PDF)

$(OUTPUT_PDF): $(TEMP_PDF)
	qpdf $(TEMP_PDF) --pages $(TITLE_PAGE) 1 $(TEMP_PDF) 1-z -- $(OUTPUT_PDF)

clean:
	rm -f $(TEMP_PDF) $(OUTPUT_PDF)

watch:
	typst watch $(TYPST_MAIN) $(TEMP_PDF)
