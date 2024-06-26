import logging, sqlite3, datetime


class DbLogger(logging.Handler):
    def __init__(self):
        logging.Handler.__init__(self)
        self.database = "logdb"
        self.conn = sqlite3.connect(self.database)
        self.cur = self.conn.cursor()

        # DB가 아직 생성되지 않았을 경우 새롭게 생성하기 위한 query문 작성
        mk_table_query = """
            CREATE TABLE IF NOT EXISTS log (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                insertTime TEXT,
                logLv TEXT,
                filename TEXT,
                lineno INTEGER,
                message TEXT
                )
        """
        self.conn.execute(mk_table_query)
        self.conn.commit()

    def time_format(self, record):
        self.now = datetime.datetime.now()
        record.nowstr = self.now.strftime("%Y-%m-%d %H:%M:%S")

    def emit(self, record):
        self.format(record)
        self.time_format(record)
        insert_db_query = """
            INSERT INTO log (
            insertTime, logLv, filename, lineno, message) VALUES
            ('{}', '{}', '{}', {}, '{}')
        """.format(
            record.nowstr,
            record.levelname,
            record.filename,
            record.lineno,
            record.message,
        )

        self.conn.execute(insert_db_query)
        self.conn.commit()

    def __del__(self):
        try:
            self.conn.close()
        except:
            pass
