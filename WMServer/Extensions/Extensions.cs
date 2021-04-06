using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;

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
    public static class Enumerations
    {
        private static string GetDescriptionAttribute(Enum value)
        {
            var fi = value.GetType().GetField(value.ToString());
            if (fi == null) return "";
            var attributes = fi.GetCustomAttributes<DescriptionAttribute>(false);
            return (attributes != null && attributes.Count() > 0) ? attributes.First().Description : null;
        }

        public static string GetEnumDescription(Enum value)
        {
            var p = GetDescriptionAttribute(value);
            return p ?? value.ToString();
        }

        
    }
}
