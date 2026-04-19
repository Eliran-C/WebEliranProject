using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.InteropServices;
using System.Web.Http;
using WebEliranProject.Html;

namespace WebEliranProject
{
    public class ValuesController : ApiController
    {
        [HttpGet] 
        [Route("api/ValuesController1/DelUser")]
        public bool DelUser(string mail, string password)
        {
            return Delete_User.DelUser(mail, password) > 0;
        }


        [HttpGet]
        [Route("api/ValuesController1/MakeAdmin")]
        public bool MakeAdmin(string mail, string password)
        {
            return Update.MakeAdminAPI(mail, password);
        }

        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}