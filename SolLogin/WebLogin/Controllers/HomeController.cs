using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using WebLogin.Models;

namespace WebLogin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        Generacion23Entities db = new Generacion23Entities();
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult ValidarUsuarioContraseña(Usuarios usu)
        {
            try
            {
                Usuarios usubd = db.Usuarios.Where(x => x.NickName == usu.NickName && x.Password == usu.Password).FirstOrDefault();
                if (usubd != null)
                {
                    Session["usuario"] = usubd;
                    return RedirectToAction("Inicio");
                }
                else
                {
                    throw new Exception("Usuario y/o contraseña incorrectos");
                }
            }
            catch (Exception ex)
            {
                TempData["error"] = ex.Message;
                return View("Login");
            }
        }

        public ActionResult Inicio()
        {
            try
            {
                Usuarios usu = (Usuarios)Session["usuario"];

                List<Contactos> lsC = db.Contactos.Where(x => x.UsuariosId == usu.id).ToList();

                TempData["usu"] = usu.NombreCompleto;

                return View(lsC);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public ActionResult Cerrar()
        {
            Session["usuario"] = null;
            return View("Login");
        }

        public ActionResult Create()
        {
            if (Session["usuario"] == null)
            {
                TempData["error"] = "No seas tramposo";
                return View("Login");
            }
            return View();
        }

        [HttpPost]
        public ActionResult Create(Contactos c)
        {
            try
            {
                Usuarios usu = (Usuarios)Session["usuario"];
                c.UsuariosId = usu.id;

                db.Contactos.Add(c);
                db.SaveChanges();
                db.Dispose();

                TempData["msj"] = "Se agrego";

                return RedirectToAction("Inicio");
            }
            catch (Exception)
            {
                return View();
            }
        }
    }
}