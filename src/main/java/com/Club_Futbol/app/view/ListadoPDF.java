package com.Club_Futbol.app.view;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.Club_Futbol.app.entity.Jugador;
import com.lowagie.text.Document;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

@Component("verJugador")
public class ListadoPDF extends AbstractPdfView{
	
	private static final String[] header = { "Id", "Nombre", "Apellido", "Numero", "Posicion" };

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		@SuppressWarnings("unchecked")
		List<Jugador> listaJugador = (List<Jugador>) model.get("listaJugador");
		PdfPTable tablaJugador = new PdfPTable(5);
		
		for (int i = 0; i < header.length; i++) {
			tablaJugador.addCell(header[i]);
		}
		
		listaJugador.forEach(jugador ->{
			tablaJugador.addCell(jugador.getId().toString());
			tablaJugador.addCell(jugador.getNombre());
			tablaJugador.addCell(jugador.getApellido());
			tablaJugador.addCell(jugador.getNumero());
			tablaJugador.addCell(jugador.getPosicion());
		});
		
		document.add(tablaJugador);
	}
	
	
	
}