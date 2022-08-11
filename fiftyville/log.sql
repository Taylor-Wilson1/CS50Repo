-- Keep a log of any SQL queries you execute as you solve the mystery.

-- What You Know
--  Theft took place on July 28
--  Theft took place on Humphrey Street

-- Identify Three Things
--  Who is the Thief
--  Where did the Thief escaped to
--  Who is the thief's accomplice who helped them escape town

-- Provided from the Video, it tells me how to obtain the description of the crime
-- Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery.
-- Interviews were conducted today with three witnesses who were present at the time – each of their interview transcripts mentions the bakery.
-- Littering took place at 16:36. No known witnesses.
SELECT description
FROM crime_scene_reports
WHERE month = 7 AND day = 28
AND street = "Humphrey Street";

-- Look at the bakery_security_logs
-- Crime took place at 10:15 am at Humphrey Street bakery.
SELECT activity FROM bakery_security_logs WHERE hour = 10 AND minute = 15;
-- Activity
-- Exit

-- Look at the bakery_security_logs to see what date the "Exit" was on.
SELECT month, day, activity FROM bakery_security_logs WHERE hour = 10 AND minute = 15;
-- Month, Day, Activity
--   7     31   Exit
-- Evidence didnt help, theft happened on 7 28

-- Look at the bakery_security_logs to see the time of entrance & exit on 7 - 28
SELECT month, day, activity, hour, minute, license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND year = 2021;
-- +-------+-----+----------+------+--------+---------------+ -- +-------+-----+----------+------+--------+---------------+
-- | month | day | activity | hour | minute | license_plate | -- |      name       |     number     | passport_number | license_plate |
-- +-------+-----+----------+------+--------+---------------+
-- | 7     | 28  | entrance | 8    | 2      | 1M92998       | -- | Alice  ENTERED  | (031) 555-9915 | 1679711307      | 1M92998       |
-- | 7     | 28  | entrance | 8    | 2      | N507616       | -- | Peter  ENTERED  | (751) 555-6567 | 9224308981      | N507616       |
-- | 7     | 28  | exit     | 8    | 2      | 1M92998       | -- | Alice  LEFT     | (031) 555-9915 | 1679711307      | 1M92998       |
-- | 7     | 28  | exit     | 8    | 2      | N507616       | -- | Peter  LEFT     | (751) 555-6567 | 9224308981      | N507616       |
-- | 7     | 28  | entrance | 8    | 7      | 7Z8B130       | -- | Rachel ENTERED  | (006) 555-0505 |                 | 7Z8B130       |
-- | 7     | 28  | exit     | 8    | 7      | 7Z8B130       | -- | Rachel LEFT     | (006) 555-0505 |                 | 7Z8B130       |
-- | 7     | 28  | entrance | 8    | 13     | 47MEFVA       | -- | Debra  ENTERED  |                | 2750542732      | 47MEFVA       |
-- | 7     | 28  | exit     | 8    | 13     | 47MEFVA       | -- | Debra  LEFT     |                | 2750542732      | 47MEFVA       |
-- | 7     | 28  | entrance | 8    | 15     | D965M59       | -- | Wayne  ENTERED  | (056) 555-0309 |                 | D965M59       |
-- | 7     | 28  | entrance | 8    | 15     | HW0488P       | -- | Jordan ENTERED  | (328) 555-9658 | 7951366683      | HW0488P       |
-- | 7     | 28  | exit     | 8    | 15     | D965M59       | -- | Wayne  LEFT     | (056) 555-0309 |                 | D965M59       |
-- | 7     | 28  | exit     | 8    | 15     | HW0488P       | -- | Jordan LEFT     | (328) 555-9658 | 7951366683      | HW0488P       |
-- | 7     | 28  | entrance | 8    | 18     | L93JTIZ       | SU | Iman   ENTERED  | (829) 555-5269 | 7049073643      | L93JTIZ       |
-- | 7     | 28  | entrance | 8    | 23     | 94KL13X       | SU | Bruce  ENTERED  | (367) 555-5533 | 5773159633      | 94KL13X       |
-- | 7     | 28  | entrance | 8    | 25     | L68E5I0       | -- | George ENTERED  |                | 4977790793      | L68E5I0       |
-- | 7     | 28  | entrance | 8    | 25     | HOD8639       | -- | Michael ENTERED | (529) 555-7276 | 6117294637      | HOD8639       |
-- | 7     | 28  | exit     | 8    | 25     | HOD8639       | -- | Michael LEFT    | (529) 555-7276 | 6117294637      | HOD8639       |
-- | 7     | 28  | exit     | 8    | 34     | L68E5I0       | -- | George LEFT     |                | 4977790793      | L68E5I0       |
-- | 7     | 28  | entrance | 8    | 34     | 1106N58       | SU | Taylor ENTERED  | (286) 555-6063 | 1988161715      | 1106N58       |
-- | 7     | 28  | entrance | 8    | 34     | W2CT78U       | -- | Andrew ENTERED  | (579) 555-5030 |                 | W2CT78U       |
-- | 7     | 28  | exit     | 8    | 34     | W2CT78U       | -- | Andrew LEFT     | (579) 555-5030 |                 | W2CT78U       |
-- | 7     | 28  | entrance | 8    | 36     | 322W7JE       | SU | Diana  ENTERED  | (770) 555-1861 | 3592750733      | 322W7JE       |
-- | 7     | 28  | entrance | 8    | 38     | 3933NUH       | -- | Ralph  ENTERED  | (771) 555-7880 | 6464352048      | 3933NUH       |
-- | 7     | 28  | exit     | 8    | 38     | 3933NUH       | -- | Ralph  LEFT     | (771) 555-7880 | 6464352048      | 3933NUH       |
-- | 7     | 28  | entrance | 8    | 42     | 0NTHK55       | SU | Kelsey ENTERED  | (499) 555-9472 | 8294398571      | 0NTHK55       |
-- | 7     | 28  | entrance | 8    | 44     | 1FBL6TH       | -- | Joshua ENTERED  | (267) 555-2761 | 3761239013      | 1FBL6TH       |
-- | 7     | 28  | exit     | 8    | 44     | 1FBL6TH       | -- | Joshua LEFT     | (267) 555-2761 | 3761239013      | 1FBL6TH       |
-- | 7     | 28  | entrance | 8    | 49     | P14PE2Q       | -- | Carolyn ENTERED | (234) 555-1294 | 3925120216      | P14PE2Q       |
-- | 7     | 28  | exit     | 8    | 49     | P14PE2Q       | -- | Carolyn LEFT    | (234) 555-1294 | 3925120216      | P14PE2Q       |
-- | 7     | 28  | entrance | 8    | 50     | 4V16VO0       | -- | Robin  ENTERED  | (375) 555-8161 |                 | 4V16VO0       |
-- | 7     | 28  | exit     | 8    | 50     | 4V16VO0       | -- | Robin  LEFT     | (375) 555-8161 |                 | 4V16VO0       |
-- | 7     | 28  | entrance | 8    | 57     | 8LLB02B       | -- | Donna  ENTERED  |                |                 | 8LLB02B       |
-- | 7     | 28  | exit     | 8    | 57     | 8LLB02B       | -- | Donna  LEFT     |                |                 | 8LLB02B       |
-- | 7     | 28  | entrance | 8    | 59     | O784M2U       | -- | Martha ENTERED  | (007) 555-2874 |                 | O784M2U       |
-- | 7     | 28  | exit     | 8    | 59     | O784M2U       | -- | Martha LEFT     | (007) 555-2874 |                 | O784M2U       |
-- | 7     | 28  | entrance | 9    | 14     | 4328GD8       | SU | Luca   ENTERED  | (389) 555-5198 | 8496433585      | 4328GD8       |
-- | 7     | 28  | entrance | 9    | 15     | 5P2BI95       | SU | Vanessa ENTERED | (725) 555-4692 | 2963008352      | 5P2BI95       |
-- | 7     | 28  | entrance | 9    | 20     | 6P58WS2       | SU | Barry  ENTERED  | (301) 555-4174 | 7526138472      | 6P58WS2       |
-- | 7     | 28  | entrance | 9    | 28     | G412CB7       | SU | Sofia  ENTERED  | (130) 555-0289 | 1695452385      | G412CB7       |
-- | 7     | 28  | entrance | 10   | 8      | R3G7486       | SU | Brandon ENTERED | (771) 555-6667 | 7874488539      | R3G7486       |
-- | 7     | 28  | entrance | 10   | 14     | 13FNH73       | SU | Sophia ENTERED  | (027) 555-1068 | 3642612721      | 13FNH73       |
-- | 7     | 28  | exit     | 10   | 16     | 5P2BI95       | SU | Vanessa LEFT    | (725) 555-4692 | 2963008352      | 5P2BI95       |
-- | 7     | 28  | exit     | 10   | 18     | 94KL13X       | SU | Bruce  LEFT     | (367) 555-5533 | 5773159633      | 94KL13X       |
-- | 7     | 28  | exit     | 10   | 18     | 6P58WS2       | SU | Barry  LEFT     | (301) 555-4174 | 7526138472      | 6P58WS2       |
-- | 7     | 28  | exit     | 10   | 19     | 4328GD8       | SU | Luca   LEFT     | (389) 555-5198 | 8496433585      | 4328GD8       |
-- | 7     | 28  | exit     | 10   | 20     | G412CB7       | SU | Sofia  LEFT     | (130) 555-0289 | 1695452385      | G412CB7       |
-- | 7     | 28  | exit     | 10   | 21     | L93JTIZ       | SU | Iman   LEFT     | (829) 555-5269 | 7049073643      | L93JTIZ       |
-- | 7     | 28  | exit     | 10   | 23     | 322W7JE       | SU | Diana  LEFT     | (770) 555-1861 | 3592750733      | 322W7JE       |
-- | 7     | 28  | exit     | 10   | 23     | 0NTHK55       | SU | Kelsey LEFT     | (499) 555-9472 | 8294398571      | 0NTHK55       |
-- | 7     | 28  | exit     | 10   | 35     | 1106N58       | SU | Taylor LEFT     | (286) 555-6063 | 1988161715      | 1106N58       |
---------------------------------------------------------------------------------------------------------------------------------------
-- | 7     | 28  | entrance | 10   | 42     | NRYN856       | -- | Denise ENTERED  | (994) 555-3373 | 4001449165      | NRYN856       |
-- | 7     | 28  | entrance | 10   | 44     | WD5M8I6       | -- | Thomas ENTERED  | (286) 555-0131 | 6034823042      | WD5M8I6       |
-- | 7     | 28  | entrance | 10   | 55     | V47T75I       | -- | Jeremy ENTERED  | (194) 555-5027 | 1207566299      | V47T75I       |
-- | 7     | 28  | entrance | 11   | 6      | 4963D92       | -- | Judith ENTERED  |                | 8284363264      | 4963D92       |
-- | 7     | 28  | entrance | 11   | 13     | C194752       | -- | Mary   ENTERED  | (188) 555-4719 |                 | C194752       |
-- | 7     | 28  | entrance | 11   | 52     | 94MV71O       | -- | Vincent ENTERED |                | 3011089587      | 94MV71O       |
-- | 7     | 28  | entrance | 12   | 20     | FLFN3W0       | -- | Daniel ENTERED  | (971) 555-6468 | 7597790505      | FLFN3W0       |
-- | 7     | 28  | entrance | 12   | 49     | 207W38T       | -- | Frank  ENTERED  | (356) 555-6641 | 8336437534      | 207W38T       |
-- | 7     | 28  | entrance | 13   | 8      | RS7I6A0       | -- | Amanda ENTERED  | (821) 555-5262 | 1618186613      | RS7I6A0       |
-- | 7     | 28  | entrance | 13   | 30     | 4468KVT       | -- | John   ENTERED  | (016) 555-9166 | 8174538026      | 4468KVT       |
-- | 7     | 28  | entrance | 13   | 42     | NAW9653       | -- | Ethan  ENTERED  | (594) 555-6254 | 2996517496      | NAW9653       |
-- | 7     | 28  | exit     | 14   | 18     | NAW9653       | -- | Ethan  LEFT     | (594) 555-6254 | 2996517496      | NAW9653       |
-- | 7     | 28  | exit     | 15   | 6      | RS7I6A0       | -- | Amanda LEFT     | (821) 555-5262 | 1618186613      | RS7I6A0       |
-- | 7     | 28  | exit     | 15   | 16     | 94MV71O       | -- | Vincent LEFT    |                | 3011089587      | 94MV71O       |
-- | 7     | 28  | exit     | 16   | 6      | WD5M8I6       | -- | Thomas LEFT     | (286) 555-0131 | 6034823042      | WD5M8I6       |
-- | 7     | 28  | exit     | 16   | 38     | 4468KVT       | -- | John   LEFT     | (016) 555-9166 | 8174538026      | 4468KVT       |
-- | 7     | 28  | exit     | 16   | 42     | 207W38T       | -- | Frank  LEFT     | (356) 555-6641 | 8336437534      | 207W38T       |
-- | 7     | 28  | exit     | 16   | 47     | C194752       | -- | Mary   LEFT     | (188) 555-4719 |                 | C194752       |
-- | 7     | 28  | exit     | 17   | 11     | NRYN856       | -- | Denise LEFT     | (994) 555-3373 | 4001449165      | NRYN856       |
-- | 7     | 28  | exit     | 17   | 15     | 13FNH73       | SU | Sophia LEFT     | (027) 555-1068 | 3642612721      | 13FNH73       |
-- | 7     | 28  | exit     | 17   | 16     | V47T75I       | -- | Jeremy LEFT     | (194) 555-5027 | 1207566299      | V47T75I       |
-- | 7     | 28  | exit     | 17   | 18     | R3G7486       | SU | Brandon LEFT    | (771) 555-6667 | 7874488539      | R3G7486       |
-- | 7     | 28  | exit     | 17   | 36     | FLFN3W0       | -- | Daniel LEFT     | (971) 555-6468 | 7597790505      | FLFN3W0       |
-- | 7     | 28  | exit     | 17   | 47     | 4963D92       | -- | Judith LEFT     |                | 8284363264      | 4963D92       |
-- +-------+-----+----------+------+--------+---------------+ -- -- +-------+-----+----------+------+--------+---------------+

-- Look at the people to compare license plate #'s to see who came into the bakery on 7 - 28.
SELECT name, phone_number, passport_number, license_plate FROM people;
-- +-------------+----------------+-----------------+---------------+
-- |    name     |  phone_number  | passport_number | license_plate |
-- +-------------+----------------+-----------------+---------------+
-- | Pamela      | (113) 555-7544 | 1050247273      | 5CIO816       |
-- | Jordan      | (328) 555-9658 | 7951366683      | HW0488P       |
-- | Heather     | (502) 555-6712 | 4356447308      |               |
-- | Vanessa     | (725) 555-4692 | 2963008352      | 5P2BI95       |
-- | Ronald      | (321) 555-6083 | 4959515588      | 9XPY28H       |
-- | Natalie     |                | 6627121233      | F494C29       |
-- | Sean        | (867) 555-9103 | 4377966420      |               |
-- | Aaron       | (420) 555-5821 | 9852889341      |               |
-- | Ernest      | (789) 555-8833 | 6216255522      | C3S4W87       |
-- | Karen       | (841) 555-3728 | 5031682798      | IH61GO8       |
-- | Margaret    | (068) 555-0183 | 1782675901      | 60563QT       |
-- | Gabriel     | (243) 555-7229 | 9747563214      | B49OR81       |
-- | Louis       | (749) 555-4874 | 5361280978      |               |
-- | Barry       | (301) 555-4174 | 7526138472      | 6P58WS2       |
-- | Abigail     | (183) 555-7322 |                 | Q98UB5W       |
-- | James       | (676) 555-6554 | 2438825627      | Q13SVG6       |
-- | Larry       | (892) 555-8872 | 2312901747      | O268ZZ0       |
-- | Kristina    | (918) 555-2946 | 6131360461      | P743G7C       |
-- | Virginia    | (478) 555-1565 | 3866596772      |               |
-- | Austin      |                | 5140313594      | P160306       |
-- | Juan        | (337) 555-9411 | 7020183712      | 8BB36NX       |
-- | Cynthia     | (458) 555-8396 | 2169423415      |               |
-- | Albert      | (042) 555-1772 |                 | 673020C       |
-- | Laura       | (067) 555-4133 | 1801324150      | 4406M71       |
-- | Christina   | (547) 555-8781 | 4322787338      | 79X5400       |
-- | Cheryl      | (450) 555-8297 |                 | VWJ25E5       |
-- | Eugene      | (666) 555-5774 | 9584465633      | 47592FJ       |
-- | Martha      | (007) 555-2874 |                 | O784M2U       |
-- | Gerald      |                | 8932594930      | X0Q6908       |
-- | Ryan        | (901) 555-8732 |                 | 0WZS77X       |
-- | Megan       | (222) 555-8026 | 4879021885      |               |
-- | Tyler       | (660) 555-3095 | 8613298074      | 3H26E71       |
-- | Gregory     | (022) 555-4052 | 3355598951      | V4C670D       |
-- | Eric        | (869) 555-6696 |                 | X8T96JM       |
-- | Jacob       | (037) 555-8455 | 5584283945      | P45A66L       |
-- | Brandon     | (771) 555-6667 | 7874488539      | R3G7486       |
-- | Brenda      | (831) 555-0973 | 1139561952      | N7M42GP       |
-- | Judy        | (918) 555-5327 | 1236213682      | KGG82IR       |
-- | Joan        | (711) 555-3007 |                 | L476K20       |
-- | Christine   | (608) 555-9302 |                 | XE95071       |
-- | Rebecca     | (891) 555-5672 | 6264773605      |               |
-- | Grace       | (932) 555-1504 | 9826028703      | HXA8903       |
-- | Helen       |                | 8810489487      | G3QW7I4       |
-- | Marilyn     | (568) 555-3190 | 7441135547      | 0R0FW39       |
-- | Walter      | (544) 555-8087 | 4223654265      | 82456Y8       |
-- | Carolyn     | (234) 555-1294 | 3925120216      | P14PE2Q       |
-- | Christopher | (775) 555-7584 | 3249120117      | 91UQ3NC       |
-- | Kayla       | (487) 555-5865 | 4674590724      | 2729MD0       |
-- | Alexander   | (801) 555-9266 |                 | 8P9NEU9       |
-- | Noah        | (959) 555-4871 | 1095374669      | 11J91FW       |
-- | Joshua      | (267) 555-2761 | 3761239013      | 1FBL6TH       |
-- | Debra       |                | 2750542732      | 47MEFVA       |
-- | Kelly       | (496) 555-2096 | 4041498045      |               |
-- | Kenny       | (826) 555-1652 | 9878712108      | 30G67EN       |
-- | Iman        | (829) 555-5269 | 7049073643      | L93JTIZ       |
-- | Sofia       | (130) 555-0289 | 1695452385      | G412CB7       |
-- | Lauren      | (707) 555-7535 | 5551547908      | 3899SY4       |
-- | Catherine   | (020) 555-6715 |                 | NA31S0K       |
-- | Teresa      | (041) 555-4011 | 8699553201      | HW0BF87       |
-- | Carol       | (168) 555-6126 | 6128131458      | 81MNC9R       |
-- | Ruth        | (772) 555-5770 |                 | HZB4129       |
-- | Benista     | (338) 555-6650 | 9586786673      | 8X428L0       |
-- | Sara        | (340) 555-8872 | 3412604728      | 99A843C       |
-- | Dennis      |                | 4149859587      |               |
-- | Taylor      | (286) 555-6063 | 1988161715      | 1106N58       |
-- | Brooke      | (122) 555-4581 | 4408372428      | QX4YZN3       |
-- | Luca        | (389) 555-5198 | 8496433585      | 4328GD8       |
-- | Billy       | (060) 555-2489 | 9290922261      | 2HB7G9N       |
-- | Anna        | (704) 555-2131 |                 |               |
-- | Barbara     | (367) 555-0409 | 1165086731      | HN8I106       |
-- | Wayne       | (056) 555-0309 |                 | D965M59       |
-- | Jesse       | (693) 555-7986 |                 | 608027W       |
-- | Stephanie   | (204) 555-4136 | 7712200330      | 2001OV9       |
-- | Susan       |                | 8623763125      |               |
-- | Samantha    | (956) 555-1395 | 6720918005      | E9PF99X       |
-- | Jean        | (695) 555-0348 | 1682575122      | JN7K44M       |
-- | Zachary     | (839) 555-1757 |                 | 5810O6V       |
-- | Diana       | (770) 555-1861 | 3592750733      | 322W7JE       |
-- | Randy       | (984) 555-5921 | 7538263720      | 106OW2W       |
-- | Jeffrey     |                | 2041495124      | EH6V12Q       |
-- | Hannah      | (877) 555-0523 | 3366196639      | 88CEO92       |
-- | Olivia      | (258) 555-5627 | 6632213958      | X273ZK9       |
-- | Bradley     | (873) 555-8470 | 1526109096      | 9Y0JT4U       |
-- | Joseph      | (238) 555-5554 | 4328444220      |               |
-- | Marie       |                |                 | C4559Y9       |
-- | Theresa     | (190) 555-4928 | 1833124350      | 668A8SL       |
-- | Michael     | (529) 555-7276 | 6117294637      | HOD8639       |
-- | Nicholas    | (095) 555-3639 | 2581746522      | 5840J5X       |
-- | Kathleen    | (960) 555-2044 | 2628207874      | PF37ZVK       |
-- | William     | (324) 555-0416 |                 | FA63H32       |
-- | Kelsey      | (499) 555-9472 | 8294398571      | 0NTHK55       |
-- | Kathryn     | (609) 555-5876 | 6121106406      | 4ZY7I8T       |
-- | Vincent     |                | 3011089587      | 94MV71O       |
-- | Jack        | (996) 555-8899 | 9029462229      | 52R0Y8U       |
-- | Paul        | (357) 555-0246 | 9143726159      | R64E41W       |
-- | Mary        | (188) 555-4719 |                 | C194752       |
-- | Betty       | (233) 555-0473 | 2400516856      | 47KK91C       |
-- | Arthur      | (394) 555-3247 | 7884829354      | 64I1286       |
-- | Justin      | (721) 555-1131 | 9608210024      |               |
-- | Dylan       | (380) 555-4380 | 5776544886      | DN6Z7FH       |
-- | Isabella    |                | 9893853348      |               |
-- | Bryan       | (696) 555-9195 | 3833243751      | 8911U63       |
-- | Ralph       | (771) 555-7880 | 6464352048      | 3933NUH       |
-- | Jessica     | (786) 555-5321 | 7118667746      | ET017P4       |
-- | Benjamin    | (680) 555-4935 |                 | I8S932C       |
-- | Jerry       | (558) 555-9741 | 3816396248      | 4DD691O       |
-- | Matthew     |                | 4195341387      | 31GVT84       |
-- | Janet       | (464) 555-2162 | 2160709651      | P72XP87       |
-- | Peter       | (751) 555-6567 | 9224308981      | N507616       |
-- | Joe         | (452) 555-8550 |                 | 24X1AQM       |
-- | Julia       |                | 5380305521      | L605IHS       |
-- | Melissa     | (717) 555-1342 | 7834357192      |               |
-- | Alexis      | (814) 555-5180 | 5310124622      | X4G3938       |
-- | Amanda      | (821) 555-5262 | 1618186613      | RS7I6A0       |
-- | Sandra      | (604) 555-0153 |                 | 2BDU20B       |
-- | Michelle    | (738) 555-2050 | 4590049635      | 52E25A9       |
-- | Charlotte   | (455) 555-5315 | 7226911797      | Z5FH038       |
-- | Rose        | (336) 555-0077 | 8909375052      | O7JQ1SA       |
-- | Alan        |                | 2884243902      | JUP02H1       |
-- | Edward      | (328) 555-1152 | 1540955065      | 130LD9Z       |
-- | Carl        | (704) 555-5790 | 7771405611      | 81MZ921       |
-- | Denise      | (994) 555-3373 | 4001449165      | NRYN856       |
-- | Brittany    | (398) 555-1013 |                 | 6T124Q8       |
-- | Thomas      | (286) 555-0131 | 6034823042      | WD5M8I6       |
-- | Steven      | (195) 555-4173 | 1151340634      | 5VFD6G0       |
-- | Samuel      |                | 2180939853      | 10J5R8P       |
-- | John        | (016) 555-9166 | 8174538026      | 4468KVT       |
-- | David       | (260) 555-0610 | 8834222028      | SF5001S       |
-- | Linda       |                | 4120608613      |               |
-- | Ethan       | (594) 555-6254 | 2996517496      | NAW9653       |
-- | Donald      | (971) 555-2231 |                 | R964VP9       |
-- | Bruce       | (367) 555-5533 | 5773159633      | 94KL13X       |
-- | Jonathan    | (211) 555-3762 | 2047409662      | 7627B71       |
-- | Henry       | (645) 555-8082 | 3699913849      | 6590Q1M       |
-- | Rachel      | (006) 555-0505 |                 | 7Z8B130       |
-- | Richard     |                | 7894166154      | 20Q418R       |
-- | Jacqueline  | (910) 555-3251 |                 | 43V0R5D       |
-- | Donna       |                |                 | 8LLB02B       |
-- | Terry       | (730) 555-5115 | 3564659888      | 5209A97       |
-- | Jason       | (636) 555-4198 | 2818150870      | 8666X39       |
-- | Ashley      | (770) 555-1196 | 1038053449      |               |
-- | Dorothy     | (047) 555-0577 | 9135709773      | 7T807V5       |
-- | Ann         | (601) 555-6795 | 4215752756      | 84869TJ       |
-- | Maria       | (492) 555-5484 |                 | 3N39WQN       |
-- | Sharon      | (343) 555-0167 | 9687940003      | 9N79I17       |
-- | Sophia      | (027) 555-1068 | 3642612721      | 13FNH73       |
-- | Judith      |                | 8284363264      | 4963D92       |
-- | Jeremy      | (194) 555-5027 | 1207566299      | V47T75I       |
-- | Daniel      | (971) 555-6468 | 7597790505      | FLFN3W0       |
-- | Jennifer    | (911) 555-0229 | 7378796210      | 1K44SN8       |
-- | Nathan      | (293) 555-1469 | 8914039923      | 11WB3I6       |
-- | Douglas     | (491) 555-2505 | 3231999695      | 1FW4EUJ       |
-- | Kyle        | (035) 555-2997 |                 | 2M2Y681       |
-- | Scott       | (801) 555-8906 | 6264781665      | 68K1239       |
-- | Keith       | (209) 555-7806 | 9698118788      | 630U2R7       |
-- | Diane       | (147) 555-6818 | 6099879058      | WR2G758       |
-- | George      |                | 4977790793      | L68E5I0       |
-- | Charles     | (427) 555-0556 | 3915621712      | R12SA4D       |
-- | Harold      | (669) 555-6918 |                 | DVS39US       |
-- | Nicole      | (123) 555-5144 | 3835860232      | 91S1K32       |
-- | Emily       | (406) 555-4440 | 6263461050      | Y340743       |
-- | Gloria      | (973) 555-3809 | 2835165196      | O010420       |
-- | Frances     | (059) 555-4698 | 5138876283      | 97O6H62       |
-- | Anthony     |                | 8639149598      | 50U175Y       |
-- | Kevin       | (618) 555-9856 |                 | QDS31M6       |
-- | Alice       | (031) 555-9915 | 1679711307      | 1M92998       |
-- | Jose        | (914) 555-5994 | 9183348466      |               |
-- | Gary        |                | 6038029185      | S5EI3B0       |
-- | Patricia    | (594) 555-2863 | 5806941094      | R059OD5       |
-- | Beverly     | (342) 555-9260 | 2793107431      |               |
-- | Nancy       | (998) 555-1979 | 7021171868      | 878Z799       |
-- | Emma        | (329) 555-5870 | 7968707324      | 1628C65       |
-- | Shirley     |                | 4754635619      | 3S8505X       |
-- | Andrew      | (579) 555-5030 |                 | W2CT78U       |
-- | Philip      | (725) 555-3243 | 3391710505      | GW362R6       |
-- | Mark        | (873) 555-3868 | 4631067354      | YD7376W       |
-- | Timothy     | (962) 555-5827 | 7178034193      | 3AML2V7       |
-- | Robin       | (375) 555-8161 |                 | 4V16VO0       |
-- | Joyce       |                | 7179245843      | 594IBK6       |
-- | Janice      | (033) 555-9033 |                 | 61226BT       |
-- | Carina      | (031) 555-6622 | 9628244268      | Q12B3Z3       |
-- | Brian       | (636) 555-3370 | 2329158653      | Y46HW88       |
-- | Katherine   |                |                 |               |
-- | Stephen     | (247) 555-7205 |                 | 99N25L1       |
-- | Frank       | (356) 555-6641 | 8336437534      | 207W38T       |
-- | Andrea      | (368) 555-3561 | 7954314541      | 245THL6       |
-- | Raymond     | (125) 555-8030 |                 | Y18DLY3       |
-- | Kaelyn      | (098) 555-1164 | 8304650265      | I449449       |
-- | Christian   |                | 2626335085      | 6CV51G1       |
-- | Amy         | (670) 555-8598 | 9355133130      |               |
-- | Doris       | (066) 555-9701 | 7214083635      | M51FA04       |
-- | Sarah       | (505) 555-5698 | 9172951504      | 47602K4       |
-- | Johnny      | (117) 555-6630 | 7918203533      | 3JC5R39       |
-- | Adam        |                |                 | FQUFJ16       |
-- | Willie      | (741) 555-1748 | 4158550933      |               |
-- | Logan       | (219) 555-0139 | 9692634019      | 6866W0M       |
-- | Deborah     | (344) 555-9601 | 8714200946      | 10I5658       |
-- | Lisa        | (118) 555-8106 |                 | B3VSJVF       |
-- | Lawrence    |                | 2290269570      | TWA51P1       |
-- | Angela      | (310) 555-8568 | 9920757687      | SS458D7       |
-- +-------------+----------------+-----------------+---------------+

-- Look at Interviews to see who were the three witnesses
SELECT name, transcript FROM interviews WHERE month = 7 AND day = 28 AND year = 2021;
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
-- | Jose    | “Ah,” said he, “I forgot that I had not seen you for some weeks. It is a little souvenir from the King of Bohemia in return for my assistance in the case of the Irene Adler papers.”                                                                                                                               |
-- | Eugene  | “I suppose,” said Holmes, “that when Mr. Windibank came back from France he was very annoyed at your having gone to the ball.”                                                                                                                                                                                      |
-- | Barbara | “You had my note?” he asked with a deep harsh voice and a strongly marked German accent. “I told you that I would call.” He looked from one to the other of us, as if uncertain which to address.                                                                                                                   |
-- | Ruth    | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.                                                          |
-- | Eugene  | I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.                                                                                                 |
-- | Raymond | As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket. |
-- | Lily    | Our neighboring courthouse has a very annoying rooster that crows loudly at 6am every day. My sons Robert and Patrick took the rooster to a city far, far away, so it may never bother us again. My sons have successfully arrived in Paris.                                                                        |
-- +---------+-------------------------------------------------------------------------------------------------------------------------------------

-- Three Witnesses:
-- | Ruth    | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.                                                          |
-- | Eugene  | I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.                                                                                                 |
-- | Raymond | As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket. |
-- +---------+-------------------------------------------------------------------------------------------------------------------------------------

-- People who left within 10 minutes of the theft:
-- Used the bakery_security_logs to pull the info form
-- +-------+-----+----------+-------+
-- |      name      | license_plate |
-- +-------+-----+----------+-------+
-- |    Vanessa     |    5P2BI95    |
-- |    Bruce       |    94KL13X    |
-- |    Barry       |    6P58WS2    |
-- |    Luca        |    4328GD8    |
-- |    Sofia       |    G412CB7    |
-- |    Iman        |    L93JTIZ    |
-- |    Diana       |    322W7JE    |
-- |    Kelsey      |    0NTHK55    |
-- +-------+-----+----------+-------+

-- Thief Withdrawing money from ATM on Leggett Street
-- Joins all three tables together to get a better idea as to who made atm_transactions
SELECT people.id, name, bank_accounts.account_number, atm_location, transaction_type, amount
FROM people JOIN bank_accounts ON people.id = bank_accounts.person_id
JOIN atm_transactions ON bank_accounts.account_number = atm_transactions.account_number
WHERE atm_location = "Leggett Street" AND month = 7 AND day = 28 AND year = 2021;

-- Original Queries, but realized that I needed all three tables JOINED
-- SELECT id, name, account_number FROM people JOIN bank_accounts ON people.id = bank_accounts.person_id WHERE account_number IN (SELECT account_number FROM atm_transactions WHERE month = 7 AND day = 28 AND year = 2021) ORDER BY account_number;
-- SELECT account_number, atm_location, transaction_type, amount FROM atm_transactions WHERE month = 7 AND day = 28 AND year = 2021;
-- +--------+---------+----------------+----------------+------------------+--------+
-- |   id   |  name   | account_number |  atm_location  | transaction_type | amount |
-- +--------+---------+----------------+----------------+------------------+--------+
-- | 686048 | Bruce   | 49610011       | Leggett Street | withdraw         | 50     |
-- | 948985 | Kaelyn  | 86363979       | Leggett Street | deposit          | 10     |
-- | 514354 | Diana   | 26013199       | Leggett Street | withdraw         | 35     |
-- | 458378 | Brooke  | 16153065       | Leggett Street | withdraw         | 80     |
-- | 395717 | Kenny   | 28296815       | Leggett Street | withdraw         | 20     |
-- | 396669 | Iman    | 25506511       | Leggett Street | withdraw         | 20     |
-- | 467400 | Luca    | 28500762       | Leggett Street | withdraw         | 48     |
-- | 449774 | Taylor  | 76054385       | Leggett Street | withdraw         | 60     |
-- | 438727 | Benista | 81061156       | Leggett Street | withdraw         | 30     |
-- +--------+---------+----------------+----------------+------------------+--------+

-- Suspects who could be the thief:
-- +-------+-----+----------+-------+
-- |      name      | license_plate |
-- +-------+-----+----------+-------+
-- |    Bruce       |    94KL13X    |
-- |    Luca        |    4328GD8    |
-- |    Iman        |    L93JTIZ    |
-- |    Diana       |    322W7JE    |
-- |    Kelsey      |    0NTHK55    |
-- +-------+-----+----------+-------+

-- Suspects Phone Records: Looking to see who talked for less than a minute
-- I inserted the receiver name mannually
SELECT caller, receiver, duration FROM phone_calls WHERE month = 7 AND day = 28 AND year = 2021;

SELECT name, caller, name, receiver, duration FROM phone_calls JOIN people ON phone_calls.caller = people.phone_number WHERE month = 7 AND day = 28 AND year = 2021 AND duration < 60;
-- +---------+----------------+---------+----------------+----------+
-- |  name   |     caller     |  name   |    receiver    | duration |
-- +---------+----------------+---------+----------------+----------+
-- | Sofia   | (130) 555-0289 | Jack    | (996) 555-8899 | 51       |
-- | Kelsey  | (499) 555-9472 | Larry   | (892) 555-8872 | 36       |
-- | Bruce   | (367) 555-5533 | Robin   | (375) 555-8161 | 45       |
-- | Kelsey  | (499) 555-9472 | Melissa | (717) 555-1342 | 50       |
-- | Taylor  | (286) 555-6063 | James   | (676) 555-6554 | 43       |
-- | Diana   | (770) 555-1861 | Philip  | (725) 555-3243 | 49       |
-- | Carina  | (031) 555-6622 | Jacqueline| (910) 555-3251 | 38       |
-- | Kenny   | (826) 555-1652 | Doris   | (066) 555-9701 | 55       |
-- | Benista | (338) 555-6650 | Anna    | (704) 555-2131 | 54       |
-- +---------+----------------+---------+----------------+----------+

-- Based off suspect list, names have been eliminated:
-- +-------+-----+----------+-------+
-- |      name      | license_plate |
-- +-------+-----+----------+-------+
-- |    Bruce       |    94KL13X    |
-- |    Luca        |    4328GD8    |
-- |    Iman        |    L93JTIZ    |
-- |    Diana       |    322W7JE    |
-- |    Kelsey      |    0NTHK55    |
-- +-------+-----+----------+-------+
-- +---------+----------------+---------+----------------+----------+
-- |  name   |     caller     |  name   |    receiver    | duration |
-- +---------+----------------+---------+----------------+----------+
-- | Kelsey  | (499) 555-9472 | Larry   | (892) 555-8872 | 36       |
-- | Bruce   | (367) 555-5533 | Robin   | (375) 555-8161 | 45       |
-- | Kelsey  | (499) 555-9472 | Melissa | (717) 555-1342 | 50       |
-- | Diana   | (770) 555-1861 | Philip  | (725) 555-3243 | 49       |
-- +---------+----------------+---------+----------------+----------+

-- After looking at phone records: Suspects who could be the thief:
-- +-------+-----+----------+-------+
-- |      name      | license_plate |
-- +-------+-----+----------+-------+
-- |    Bruce       |    94KL13X    |
-- |    Diana       |    322W7JE    |
-- |    Kelsey      |    0NTHK55    |
-- +-------+-----+----------+-------+

-- After looking at phone records: Suspects who could be the accomplice:
-- +-------+-----+----------+-------+
-- |      name      | license_plate |
-- +-------+-----+----------+-------+
-- |    Larry       |    O268ZZ0    |
-- |    Robin       |    4V16VO0    |
-- |    Melissa     |               |
-- |    Philip      |    GW362R6    |
-- +-------+-----+----------+-------+

--------------------------------------------------------------------------------------------------------------------------------------
-- Look for earliest flights out of Fiftyville on month 7 day 29 year 2021
SELECT origin_airport_id, destination_airport_id, hour, minute FROM flights WHERE month = 7 AND day = 29 AND year = 2021 ORDER BY hour;

SELECT airports.id, abbreviation, full_name, city, hour, minute FROM airports JOIN flights ON airports.id = flights.origin_airport_id WHERE month = 7 AND day = 29 AND year = 2021 ORDER BY hour;
-- +----+--------------+-----------------------------+------------+------+--------+
-- | id | abbreviation |          full_name          |    city    | hour | minute |
-- +----+--------------+-----------------------------+------------+------+--------+
-- | 8  | CSF          | Fiftyville Regional Airport | Fiftyville | 8    | 20     |
-- | 8  | CSF          | Fiftyville Regional Airport | Fiftyville | 9    | 30     |
-- | 8  | CSF          | Fiftyville Regional Airport | Fiftyville | 12   | 15     |
-- | 8  | CSF          | Fiftyville Regional Airport | Fiftyville | 15   | 20     |
-- | 8  | CSF          | Fiftyville Regional Airport | Fiftyville | 16   | 0      |
-- +----+--------------+-----------------------------+------------+------+--------+



-- Look to see who boarded the flight at 8: 20 on 7 / 28
SELECT origin_airport_id, name, people.passport_number, seat, hour, minute, abbreviation, full_name, city FROM flights JOIN airports ON flights.origin_airport_id = airports.id
JOIN passengers ON flights.id = passengers.flight_id
JOIN people ON passengers.passport_number = people.passport_number WHERE month = 7 AND day = 29 AND hour = 8 AND city = "Fiftyville" ORDER BY hour;

-- +-------------------+--------+-----------------+------+------+--------+--------------+-----------------------------+------------+
-- | origin_airport_id |  name  | passport_number | seat | hour | minute | abbreviation |          full_name          |    city    |
-- +-------------------+--------+-----------------+------+------+--------+--------------+-----------------------------+------------+
-- | 8                 | Edward | 1540955065      | 5C   | 8    | 20     | CSF          | Fiftyville Regional Airport | Fiftyville |
-- | 8                 | Sofia  | 1695452385      | 3B   | 8    | 20     | CSF          | Fiftyville Regional Airport | Fiftyville |
-- | 8                 | Taylor | 1988161715      | 6D   | 8    | 20     | CSF          | Fiftyville Regional Airport | Fiftyville |
-- | 8                 | Bruce  | 5773159633      | 4A   | 8    | 20     | CSF          | Fiftyville Regional Airport | Fiftyville |
-- | 8                 | Doris  | 7214083635      | 2A   | 8    | 20     | CSF          | Fiftyville Regional Airport | Fiftyville |
-- | 8                 | Kelsey | 8294398571      | 6C   | 8    | 20     | CSF          | Fiftyville Regional Airport | Fiftyville |
-- | 8                 | Luca   | 8496433585      | 7B   | 8    | 20     | CSF          | Fiftyville Regional Airport | Fiftyville |
-- | 8                 | Kenny  | 9878712108      | 7A   | 8    | 20     | CSF          | Fiftyville Regional Airport | Fiftyville |
-- +-------------------+--------+-----------------+------+------+--------+--------------+-----------------------------+------------+

-- After looking at flight records: Suspects who could be the thief:
-- +-------+-----+----------+-------+
-- |      name      | license_plate |
-- +-------+-----+----------+-------+
-- |    Bruce       |    94KL13X    |
-- |    Kelsey      |    0NTHK55    |
-- +-------+-----+----------+-------+

-- Look to see who departed the flight 8: 20 on 7 / 28
SELECT destination_airport_id, name, people.passport_number, seat, hour, minute, abbreviation, full_name, city FROM flights JOIN airports ON flights.destination_airport_id = airports.id
JOIN passengers ON flights.id = passengers.flight_id
JOIN people ON passengers.passport_number = people.passport_number WHERE month = 7 AND day = 29 AND hour = 8 ORDER BY hour;

-- +------------------------+--------+-----------------+------+------+--------+--------------+-------------------+---------------+
-- | destination_airport_id |  name  | passport_number | seat | hour | minute | abbreviation |     full_name     |     city      |
-- +------------------------+--------+-----------------+------+------+--------+--------------+-------------------+---------------+
-- | 4                      | Edward | 1540955065      | 5C   | 8    | 20     | LGA          | LaGuardia Airport | New York City |
-- | 4                      | Sofia  | 1695452385      | 3B   | 8    | 20     | LGA          | LaGuardia Airport | New York City |
-- | 4                      | Taylor | 1988161715      | 6D   | 8    | 20     | LGA          | LaGuardia Airport | New York City |
-- | 4                      | Bruce  | 5773159633      | 4A   | 8    | 20     | LGA          | LaGuardia Airport | New York City |
-- | 4                      | Doris  | 7214083635      | 2A   | 8    | 20     | LGA          | LaGuardia Airport | New York City |
-- | 4                      | Kelsey | 8294398571      | 6C   | 8    | 20     | LGA          | LaGuardia Airport | New York City |
-- | 4                      | Luca   | 8496433585      | 7B   | 8    | 20     | LGA          | LaGuardia Airport | New York City |
-- | 4                      | Kenny  | 9878712108      | 7A   | 8    | 20     | LGA          | LaGuardia Airport | New York City |
-- +------------------------+--------+-----------------+------+------+--------+--------------+-------------------+---------------+








-- SELECT flight_id, name, passport_number, seat FROM passengers JOIN people ON passengers

-- SELECT flight_id, passport_number, seat FROM passengers WHERE flight_id = 8;
-- | flight_id | passport_number | seat |
-- +-----------+-----------------+------+
-- | 8         | 9172951504      | 5A   |
-- | 8         | 5310124622      | 6D   |
-- | 8         | 5806941094      | 7B   |
-- | 8         | 9852889341      | 8A   |
-- | 8         | 3699913849      | 9C   |
-- | 8         | 2996517496      | 2C   |
-- +-----------+-----------------+------+





-- SELECT origin_airport_id, abbreviation, full_name, city FROM flights JOIN airports ON flights.origin_airport_id = airports.id WHERE origin_airport_id = 8 AND hour = 8 AND minute = 20;
-- | origin_airport_id | abbreviation |          full_name          |    city    |
-- +-------------------+--------------+-----------------------------+------------+
-- | 8                 | CSF          | Fiftyville Regional Airport | Fiftyville |
-- +-------------------+--------------+-----------------------------+------------+


-- SELECT origin_airport_id, destination_airport_id FROM flights WHERE id IN (SELECT id FROM airports);
-- SELECT origin_airport_id, abbreviation, full_name, city FROM flights JOIN airports ON flights.origin_airport_id = airports.id;
-- +-------------------+--------------+-----------------------------------------+---------------+
-- | origin_airport_id | abbreviation |                full_name                |     city      |
-- +-------------------+--------------+-----------------------------------------+---------------+
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 2                 | PEK          | Beijing Capital International Airport   | Beijing       |
-- | 1                 | ORD          | O'Hare International Airport            | Chicago       |
-- | 1                 | ORD          | O'Hare International Airport            | Chicago       |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 2                 | PEK          | Beijing Capital International Airport   | Beijing       |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 2                 | PEK          | Beijing Capital International Airport   | Beijing       |
-- | 3                 | LAX          | Los Angeles International Airport       | Los Angeles   |
-- | 5                 | DFS          | Dallas/Fort Worth International Airport | Dallas        |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 2                 | PEK          | Beijing Capital International Airport   | Beijing       |
-- | 6                 | BOS          | Logan International Airport             | Boston        |
-- | 3                 | LAX          | Los Angeles International Airport       | Los Angeles   |
-- | 1                 | ORD          | O'Hare International Airport            | Chicago       |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 7                 | DXB          | Dubai International Airport             | Dubai         |
-- | 5                 | DFS          | Dallas/Fort Worth International Airport | Dallas        |
-- | 2                 | PEK          | Beijing Capital International Airport   | Beijing       |
-- | 5                 | DFS          | Dallas/Fort Worth International Airport | Dallas        |
-- | 3                 | LAX          | Los Angeles International Airport       | Los Angeles   |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 5                 | DFS          | Dallas/Fort Worth International Airport | Dallas        |
-- | 6                 | BOS          | Logan International Airport             | Boston        |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 5                 | DFS          | Dallas/Fort Worth International Airport | Dallas        |
-- | 7                 | DXB          | Dubai International Airport             | Dubai         |
-- | 3                 | LAX          | Los Angeles International Airport       | Los Angeles   |
-- | 4                 | LGA          | LaGuardia Airport                       | New York City |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 4                 | LGA          | LaGuardia Airport                       | New York City |
-- | 5                 | DFS          | Dallas/Fort Worth International Airport | Dallas        |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 4                 | LGA          | LaGuardia Airport                       | New York City |
-- | 3                 | LAX          | Los Angeles International Airport       | Los Angeles   |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 8                 | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 4                 | LGA          | LaGuardia Airport                       | New York City |
-- | 3                 | LAX          | Los Angeles International Airport       | Los Angeles   |
-- | 3                 | LAX          | Los Angeles International Airport       | Los Angeles   |
-- +-------------------+--------------+-----------------------------------------+---------------+

-- SELECT id, abbreviation, full_name, city FROM airports;
-- +----+--------------+-----------------------------------------+---------------+
-- | id | abbreviation |                full_name                |     city      |
-- +----+--------------+-----------------------------------------+---------------+
-- | 1  | ORD          | O'Hare International Airport            | Chicago       |
-- | 2  | PEK          | Beijing Capital International Airport   | Beijing       |
-- | 3  | LAX          | Los Angeles International Airport       | Los Angeles   |
-- | 4  | LGA          | LaGuardia Airport                       | New York City |
-- | 5  | DFS          | Dallas/Fort Worth International Airport | Dallas        |
-- | 6  | BOS          | Logan International Airport             | Boston        |
-- | 7  | DXB          | Dubai International Airport             | Dubai         |
-- | 8  | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 9  | HND          | Tokyo International Airport             | Tokyo         |
-- | 10 | CDG          | Charles de Gaulle Airport               | Paris         |
-- | 11 | SFO          | San Francisco International Airport     | San Francisco |
-- | 12 | DEL          | Indira Gandhi International Airport     | Delhi         |
-- +----+--------------+-----------------------------------------+---------------+


