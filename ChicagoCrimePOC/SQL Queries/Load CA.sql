/****** Script for SelectTopNRows command from SSMS  ******/
DROP TABLE D_CommunityArea_Polygon

SELECT
	   CA.CommunityAreaKey
	  ,CA.CommunityAreaCode
	  ,CA.CommunityAreaName
	  ,CAST([Latitude_ca] AS DECIMAL(9,6)) AS Latitude
	  ,CAST([Longitude_ca] AS DECIMAL(9,6)) AS Longitude
      ,CAST([sequence_ca] AS INT) AS Sequence
  INTO D_CommunityArea_Polygon
  FROM [geo_dimensions] geo
  JOIN D_CommunityArea CA
	ON geo.comarea_num = CA.communityareacode
  WHERE ISNULL(LTRIM(RTRIM(Longitude_ca)),'') <> ''
ORDER BY CA.CommunityAreaKey, Sequence