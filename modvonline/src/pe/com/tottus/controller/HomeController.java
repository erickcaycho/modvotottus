package pe.com.tottus.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pe.com.tottus.dao.ProductoDAO;
import pe.com.tottus.modelo.*;

import java.io.IOException;
import java.util.List;

/**
 * Created by ecaycho on 26/05/2018.
 */
@Controller
@SessionAttributes("producto")
public class HomeController {
    protected static final Logger log = Logger.getLogger(HomeController.class);

    @Autowired
    private ProductoDAO productoDAO;

    public HomeController(){
        System.out.println("init HomeController");
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String printWelcome(ModelAndView model) throws IOException {
        return "home";
    }


    @RequestMapping(value = "/listaproducto", method = RequestMethod.GET)
    public
    @ResponseBody
    List<Producto> listarProducto() {

        List<Producto> listarProducto = productoDAO.listaProducto();

        log.info("Size producto: " + listarProducto.size());
        return listarProducto;

    }

    @RequestMapping(value = "/obtenerproducto/{codproducto}", method = RequestMethod.GET)
    public
    @ResponseBody
    List<Producto> obtenerProducto(@PathVariable("codproducto") String codproducto) {

        List<Producto> obtenerProducto = productoDAO.obtenerProducto(codproducto);


        return obtenerProducto;

    }

}