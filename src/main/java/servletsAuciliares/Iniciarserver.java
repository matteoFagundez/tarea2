package servletsAuciliares;


import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import interfaces.Fabrica;
import interfaces.IControlador;




@WebServlet("/Iniciarserver")
public class Iniciarserver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Iniciarserver() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
        IControlador icon = fabrica.getIControlador();
        icon.ListarDtUsuario();
        RequestDispatcher rd;
        request.setAttribute("login", "OK");
        rd = request.getRequestDispatcher("/InicioSesion.jsp");
        rd.forward(request, response);
        System.out.println("hola\n");

        doGet(request, response);
	}

}
