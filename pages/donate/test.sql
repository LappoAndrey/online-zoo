CASE
    WHEN (
        coalesce(
            round(
                sum(ostBeginn) FILTER (
                    WHERE
                        PARTNERS.innername = '' % s ''
                ),
                3
            ),
            0
        ) + coalesce(
            round(
                sum(ostEnd) FILTER (
                    WHERE
                        PARTNERS.innername = '' % s ''
                ),
                3
            ),
            0
        )
    ) <= 0 THEN 0
    ELSE round(
        (
            coalesce(
                round(
                    sum(Prodano) FILTER (
                        WHERE
                            PARTNERS.innername = '' % s ''
                    ),
                    3
                ),
                0
            ) / (dayss)
        ) / (
            (
                coalesce(
                    round(
                        sum(ostBeginn) FILTER (
                            WHERE
                                PARTNERS.innername = '' % s ''
                        ),
                        3
                    ),
                    0
                ) + coalesce(
                    round(
                        sum(ostEnd) FILTER (
                            WHERE
                                PARTNERS.innername = '' % s ''
                        ),
                        3
                    ),
                    0
                )
            ) / 2
        ),
        2
    )
END as % I " Оборачиваемость" '