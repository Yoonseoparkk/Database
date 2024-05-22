from log.loggfile import Logger

if __name__ == "__main__":
    logger = Logger()

    logger.info("프로그램 작동 시작")

    try:
        import asd
    except Exception as e:
        logger.error(e)

    logger.info("프로그램 작동 종료")
