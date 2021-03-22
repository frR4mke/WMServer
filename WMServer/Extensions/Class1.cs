using System;
using System.Collections.Generic;
using System.Linq;

namespace Extensions
{
	public static class Extensions
	{
		public static bool IsEmpty(this string str)
		{
			return String.IsNullOrEmpty(str) ? true : str.Trim() == String.Empty;
		}
		public static string Join(this IEnumerable<string> str, string separator, bool excludeEmpties = true)
		{
			return String.Join(separator, str.Where(s => !excludeEmpties || !String.IsNullOrEmpty(s)).ToArray());
		}
		public static void AddIfNotExists<TKey, TValue>(this IDictionary<TKey, TValue> dict, TKey key, TValue value)
		{
			if (!dict.ContainsKey(key))
				dict.Add(key, value);
		}
		public static DateTime EndDay(this DateTime date)
		{
			return date.AddHours(23).AddMinutes(59);
		}
		
	}
}
