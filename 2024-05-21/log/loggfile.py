import os
import logging


class Logger:
    def __init__(self):
        self.logger = logging.getLogger("파일로그")
        self.file_name = os.path.basename(
            "file_log.log"
        )  # full 경로를 입력하지 않으면 실행파일 위치에 로그파일 생성됨

        if len(self.logger.handlers) == 0:  # 아직 생성되지 않았을 때 파일 생성
            formatter = logging.Formatter(
                "%(asctime)s [%(levelname)s] %(message)s"
            )  # 원하는 양식으로 맞춰준다

            file_handler = logging.FileHandler(self.file_name, encoding="utf-8")
            file_handler.setFormatter(formatter)

            self.logger.addHandler(file_handler)
            self.logger.setLevel(
                logging.INFO  # 보통 INFO 정도로 설정함
            )  # 로깅 수준 설정 : INFO, ERROR, WARN, FATAL 등..

    def info(self, value):
        self.logger.info("%s (at %s)" % (str(value), self.file_name))

    def error(self, value):
        self.logger.error("%s (at %s)" % (str(value), self.file_name))

        # try:
        #     pass
        # except Exception as e:
        #     self.error(e)
        #     print(e)
