import fitz  # PyMuPDF

def remove_watermark(input_pdf, output_pdf, watermark_text):
    pdf_document = fitz.open(input_pdf)
    
    for page_number in range(len(pdf_document)):
        page = pdf_document[page_number]
        text_instances = page.search_for(watermark_text)
        
        for inst in text_instances:
            # Remove the watermark text by drawing a white rectangle over it.
            rect = inst.rect
            page.drawRect(rect, fill=(1, 1, 1))
    
    pdf_document.save(output_pdf)
    pdf_document.close()

if __name__ == "__main__":
    input_pdf_file = "c#.pdf"  # Replace with your input PDF file
    output_pdf_file = "output.pdf"  # Replace with the output PDF file
    watermark_text_to_remove = "REVIEWER COPY"  # Replace with the watermark text you want to remove

    remove_watermark(input_pdf_file, output_pdf_file, watermark_text_to_remove)
