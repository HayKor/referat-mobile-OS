TYPST_MAIN = index.typ
BIB_FILE = ref/refs.bib
TITLE_PAGE = title.pdf
TEMP_PDF = index.pdf
OUTPUT_PDF = Багинян_А_В_реферат_Мобильные_ОС.pdf

.PHONY: clean watch

all: $(OUTPUT_PDF)

$(TEMP_PDF): $(TYPST_MAIN) $(BIB_FILE) include/*.typ settings/*.typ
	typst compile $(TYPST_MAIN) $(TEMP_PDF)

$(OUTPUT_PDF): $(TEMP_PDF)
	qpdf $(TEMP_PDF) --pages $(TITLE_PAGE) 1 $(TEMP_PDF) 1-z -- $(OUTPUT_PDF)

clean:
	rm -f $(TEMP_PDF)

# Режим наблюдения (удобно при разработке)
# Внимание: он не будет клеить PDF автоматически при каждом изменении,
# так как qpdf — тяжелая операция, но будет обновлять temp файл.
watch:
	typst watch $(TYPST_MAIN) $(TEMP_PDF)
