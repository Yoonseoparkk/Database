from log.loggdb import DbLogger
import logging

if __name__ == "__main__":

    logger = logging.getLogger("logdb")
    logger.setLevel(logging.DEBUG)
    sqliteHandler = DbLogger()
    logger.addHandler(sqliteHandler)

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    logger.debug("디버깅")
    logger.info("잘됨")
    logger.warning("경고")
    logger.critical("심각")
