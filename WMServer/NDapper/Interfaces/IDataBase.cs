using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using static Dapper.SqlMapper;

namespace NDapper.Interfaces
{
	public interface IDataBase
	{
		IEnumerable<T> ExucuteQuery<T>(string query, object param = null);		

	}
	public interface IDapperRepository<T>
	{
		void CreateEntity(T entity);
		T FindEntity(int? id);
		IEnumerable<T> GetTable();
		void EditEntity(T entity);
		void DeleteEntity(int id);
		void Dispose(bool disposing);
		void Dispose();

	}
}
