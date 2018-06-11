/**
 * Created by huangcb on 2017/8/22.
 */
package utils {
public class Similarity {
        private static function ld(str1 : String, str2 : String) : int {
            var d : Array = [];
            var n : int = str1.length;
            var m : int = str2.length;
            var i : int;
            var j : int;

            var ch1 : String;
            var ch2 : String;
            var temp : int;

            if (n == 0) {
                return m;
            }
            if (m == 0) {
                return n;
            }

            for (i = 0; i <= n; i++) {
                if (!d[i])
                    d[i] = [];
                d[i][0] = i;
            }
            for (j = 0; j <= m; j++) {
                if (!d[0])
                    d[0] = [];
                d[0][j] = j;
            }
            for (i = 1; i <= n; i++) {
                ch1 = str1.charAt(i - 1);
                for (j = 1; j <= m; j++) {
                    ch2 = str2.charAt(j - 1);
                    if (ch1 == ch2) {
                        temp = 0;
                    } else {
                        temp = 1;
                    }
                    d[i][j] = Math.min(d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + temp);
                }
            }
            return d[n][m];
        }

        public static function sim(str1 : String, str2 : String) : Number {
            var lds : int = ld(str1, str2);
            return 1 - Number(lds / Math.max(str1.length, str2.length));
        }
}
}
