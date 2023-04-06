<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyAlgorithm="0" styleCategories="AllStyleCategories" simplifyLocal="1" simplifyDrawingTol="1" simplifyMaxScale="1" labelsEnabled="1" version="3.18.1-Zürich" minScale="100000000" maxScale="0" hasScaleBasedVisibilityFlag="0" simplifyDrawingHints="0" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal startField="" startExpression="" enabled="0" endExpression="" endField="" accumulate="0" mode="0" fixedDuration="0" durationField="" durationUnit="min">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 enableorderby="0" forceraster="0" type="singleSymbol" symbollevels="0">
    <symbols>
      <symbol name="0" type="marker" clip_to_extent="1" alpha="1" force_rhr="0">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" pass="0" enabled="1" class="RasterMarker">
          <Option type="Map">
            <Option name="alpha" value="1" type="QString"/>
            <Option name="angle" value="0" type="QString"/>
            <Option name="fixedAspectRatio" value="0" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="imageFile" value="D:/QGIS/Löschwasser/Styles/Brunnen.png" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="5" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <prop k="alpha" v="1"/>
          <prop k="angle" v="0"/>
          <prop k="fixedAspectRatio" v="0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="imageFile" v="D:/QGIS/Löschwasser/Styles/Brunnen.png"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="5"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{a7b70d9c-2d9b-48ef-ab2b-4ed4a950a915}">
      <rule key="{742255a6-afc8-4373-a91a-5fc90ef80e14}" scalemindenom="1" scalemaxdenom="25000">
        <settings calloutType="simple">
          <text-style useSubstitutions="0" fontWeight="50" fieldName="to_string(leistung)" fontStrikeout="0" fontKerning="1" fontSize="8" fontSizeMapUnitScale="3x:0,0,0,0,0,0" capitalization="0" fontFamily="MS Shell Dlg 2" textOpacity="1" namedStyle="Standard" previewBkgrdColor="255,255,255,255" textOrientation="horizontal" allowHtml="0" textColor="0,0,0,255" blendMode="0" isExpression="1" fontWordSpacing="0" multilineHeight="1" fontUnderline="0" fontLetterSpacing="0" fontItalic="0" fontSizeUnit="Point">
            <text-buffer bufferSize="1" bufferNoFill="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferDraw="1" bufferBlendMode="0" bufferSizeUnits="MM" bufferJoinStyle="128" bufferColor="255,255,255,255" bufferOpacity="1"/>
            <text-mask maskSizeUnits="MM" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskOpacity="1" maskType="0" maskSize="0" maskEnabled="0" maskJoinStyle="128" maskedSymbolLayers=""/>
            <background shapeRadiiX="0" shapeOffsetUnit="MM" shapeSizeType="0" shapeRotation="0" shapeSizeY="0" shapeSizeX="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeBorderColor="128,128,128,255" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeBlendMode="0" shapeType="0" shapeRotationType="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeSVGFile="" shapeRadiiY="0" shapeOffsetX="0" shapeRadiiUnit="MM" shapeSizeUnit="MM" shapeOpacity="1" shapeBorderWidthUnit="MM" shapeOffsetY="0" shapeFillColor="255,255,255,255" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeDraw="0">
              <symbol name="markerSymbol" type="marker" clip_to_extent="1" alpha="1" force_rhr="0">
                <data_defined_properties>
                  <Option type="Map">
                    <Option name="name" value="" type="QString"/>
                    <Option name="properties"/>
                    <Option name="type" value="collection" type="QString"/>
                  </Option>
                </data_defined_properties>
                <layer locked="0" pass="0" enabled="1" class="SimpleMarker">
                  <Option type="Map">
                    <Option name="angle" value="0" type="QString"/>
                    <Option name="color" value="196,60,57,255" type="QString"/>
                    <Option name="horizontal_anchor_point" value="1" type="QString"/>
                    <Option name="joinstyle" value="bevel" type="QString"/>
                    <Option name="name" value="circle" type="QString"/>
                    <Option name="offset" value="0,0" type="QString"/>
                    <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="offset_unit" value="MM" type="QString"/>
                    <Option name="outline_color" value="35,35,35,255" type="QString"/>
                    <Option name="outline_style" value="solid" type="QString"/>
                    <Option name="outline_width" value="0" type="QString"/>
                    <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="outline_width_unit" value="MM" type="QString"/>
                    <Option name="scale_method" value="diameter" type="QString"/>
                    <Option name="size" value="2" type="QString"/>
                    <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                    <Option name="size_unit" value="MM" type="QString"/>
                    <Option name="vertical_anchor_point" value="1" type="QString"/>
                  </Option>
                  <prop k="angle" v="0"/>
                  <prop k="color" v="196,60,57,255"/>
                  <prop k="horizontal_anchor_point" v="1"/>
                  <prop k="joinstyle" v="bevel"/>
                  <prop k="name" v="circle"/>
                  <prop k="offset" v="0,0"/>
                  <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="offset_unit" v="MM"/>
                  <prop k="outline_color" v="35,35,35,255"/>
                  <prop k="outline_style" v="solid"/>
                  <prop k="outline_width" v="0"/>
                  <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="outline_width_unit" v="MM"/>
                  <prop k="scale_method" v="diameter"/>
                  <prop k="size" v="2"/>
                  <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="size_unit" v="MM"/>
                  <prop k="vertical_anchor_point" v="1"/>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option name="name" value="" type="QString"/>
                      <Option name="properties"/>
                      <Option name="type" value="collection" type="QString"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowOffsetAngle="135" shadowOffsetGlobal="1" shadowDraw="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusAlphaOnly="0" shadowColor="0,0,0,255" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowRadius="1.5" shadowOpacity="0.7" shadowUnder="0" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadiusUnit="MM" shadowBlendMode="6"/>
            <dd_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format reverseDirectionSymbol="0" plussign="0" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" formatNumbers="0" addDirectionSymbol="0" leftDirectionSymbol="&lt;" wrapChar="" useMaxLineLengthForAutoWrap="1" decimals="3" autoWrapLength="0"/>
          <placement lineAnchorPercent="0.5" offsetType="0" priority="5" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" dist="3" centroidInside="0" xOffset="0" preserveRotation="1" offsetUnits="MM" maxCurvedCharAngleIn="25" lineAnchorType="0" geometryGeneratorType="PointGeometry" distMapUnitScale="3x:0,0,0,0,0,0" distUnits="MM" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" centroidWhole="0" rotationAngle="0" overrunDistance="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" placementFlags="10" yOffset="0" overrunDistanceUnit="MM" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" fitInPolygonOnly="0" geometryGeneratorEnabled="0" maxCurvedCharAngleOut="-25" repeatDistance="0" layerType="PointGeometry" placement="0" geometryGenerator="" repeatDistanceUnits="MM" quadOffset="4" polygonPlacementFlags="2"/>
          <rendering fontMinPixelSize="3" obstacle="0" displayAll="1" limitNumLabels="0" scaleMin="0" labelPerPart="0" mergeLines="0" obstacleType="0" scaleMax="0" fontMaxPixelSize="10000" drawLabels="1" upsidedownLabels="0" obstacleFactor="1" fontLimitPixelSize="0" zIndex="0" scaleVisibility="0" maxNumLabels="2000" minFeatureSize="0"/>
          <dd_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option name="anchorPoint" value="pole_of_inaccessibility" type="QString"/>
              <Option name="ddProperties" type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
              <Option name="drawToAllParts" value="false" type="bool"/>
              <Option name="enabled" value="0" type="QString"/>
              <Option name="labelAnchorPoint" value="point_on_exterior" type="QString"/>
              <Option name="lineSymbol" value="&lt;symbol name=&quot;symbol&quot; type=&quot;line&quot; clip_to_extent=&quot;1&quot; alpha=&quot;1&quot; force_rhr=&quot;0&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer locked=&quot;0&quot; pass=&quot;0&quot; enabled=&quot;1&quot; class=&quot;SimpleLine&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;align_dash_pattern&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;capstyle&quot; value=&quot;square&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash&quot; value=&quot;5;2&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;draw_inside_polygon&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;joinstyle&quot; value=&quot;bevel&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_color&quot; value=&quot;60,60,60,255&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_style&quot; value=&quot;solid&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_width&quot; value=&quot;0.3&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_width_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;ring_filter&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;tweak_dash_pattern_on_corners&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;use_custom_dash&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;width_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;prop k=&quot;align_dash_pattern&quot; v=&quot;0&quot;/>&lt;prop k=&quot;capstyle&quot; v=&quot;square&quot;/>&lt;prop k=&quot;customdash&quot; v=&quot;5;2&quot;/>&lt;prop k=&quot;customdash_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;customdash_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;dash_pattern_offset&quot; v=&quot;0&quot;/>&lt;prop k=&quot;dash_pattern_offset_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;dash_pattern_offset_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;draw_inside_polygon&quot; v=&quot;0&quot;/>&lt;prop k=&quot;joinstyle&quot; v=&quot;bevel&quot;/>&lt;prop k=&quot;line_color&quot; v=&quot;60,60,60,255&quot;/>&lt;prop k=&quot;line_style&quot; v=&quot;solid&quot;/>&lt;prop k=&quot;line_width&quot; v=&quot;0.3&quot;/>&lt;prop k=&quot;line_width_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;offset&quot; v=&quot;0&quot;/>&lt;prop k=&quot;offset_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;offset_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;ring_filter&quot; v=&quot;0&quot;/>&lt;prop k=&quot;tweak_dash_pattern_on_corners&quot; v=&quot;0&quot;/>&lt;prop k=&quot;use_custom_dash&quot; v=&quot;0&quot;/>&lt;prop k=&quot;width_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString"/>
              <Option name="minLength" value="0" type="double"/>
              <Option name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="minLengthUnit" value="MM" type="QString"/>
              <Option name="offsetFromAnchor" value="0" type="double"/>
              <Option name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="offsetFromAnchorUnit" value="MM" type="QString"/>
              <Option name="offsetFromLabel" value="0" type="double"/>
              <Option name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="offsetFromLabelUnit" value="MM" type="QString"/>
            </Option>
          </callout>
        </settings>
      </rule>
    </rules>
  </labeling>
  <customproperties>
    <property key="QFieldSync/action" value="offline"/>
    <property key="QFieldSync/photo_naming" value="{}"/>
    <property key="dualview/previewExpressions" value="&quot;id&quot;"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory direction="1" height="15" minimumSize="0" backgroundAlpha="255" spacingUnitScale="3x:0,0,0,0,0,0" sizeScale="3x:0,0,0,0,0,0" penAlpha="255" sizeType="MM" enabled="0" diagramOrientation="Up" rotationOffset="270" spacing="0" showAxis="0" spacingUnit="MM" lineSizeType="MM" width="15" opacity="1" scaleBasedVisibility="0" barWidth="5" scaleDependency="Area" lineSizeScale="3x:0,0,0,0,0,0" minScaleDenominator="0" backgroundColor="#ffffff" penWidth="0" maxScaleDenominator="1e+08" penColor="#000000" labelPlacementMethod="XHeight">
      <fontProperties description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" style=""/>
      <attribute color="#000000" label="" field=""/>
      <axisSymbol>
        <symbol name="" type="line" clip_to_extent="1" alpha="1" force_rhr="0">
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
          <layer locked="0" pass="0" enabled="1" class="SimpleLine">
            <Option type="Map">
              <Option name="align_dash_pattern" value="0" type="QString"/>
              <Option name="capstyle" value="square" type="QString"/>
              <Option name="customdash" value="5;2" type="QString"/>
              <Option name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="customdash_unit" value="MM" type="QString"/>
              <Option name="dash_pattern_offset" value="0" type="QString"/>
              <Option name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="dash_pattern_offset_unit" value="MM" type="QString"/>
              <Option name="draw_inside_polygon" value="0" type="QString"/>
              <Option name="joinstyle" value="bevel" type="QString"/>
              <Option name="line_color" value="35,35,35,255" type="QString"/>
              <Option name="line_style" value="solid" type="QString"/>
              <Option name="line_width" value="0.26" type="QString"/>
              <Option name="line_width_unit" value="MM" type="QString"/>
              <Option name="offset" value="0" type="QString"/>
              <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
              <Option name="offset_unit" value="MM" type="QString"/>
              <Option name="ring_filter" value="0" type="QString"/>
              <Option name="tweak_dash_pattern_on_corners" value="0" type="QString"/>
              <Option name="use_custom_dash" value="0" type="QString"/>
              <Option name="width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            </Option>
            <prop k="align_dash_pattern" v="0"/>
            <prop k="capstyle" v="square"/>
            <prop k="customdash" v="5;2"/>
            <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <prop k="customdash_unit" v="MM"/>
            <prop k="dash_pattern_offset" v="0"/>
            <prop k="dash_pattern_offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <prop k="dash_pattern_offset_unit" v="MM"/>
            <prop k="draw_inside_polygon" v="0"/>
            <prop k="joinstyle" v="bevel"/>
            <prop k="line_color" v="35,35,35,255"/>
            <prop k="line_style" v="solid"/>
            <prop k="line_width" v="0.26"/>
            <prop k="line_width_unit" v="MM"/>
            <prop k="offset" v="0"/>
            <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <prop k="offset_unit" v="MM"/>
            <prop k="ring_filter" v="0"/>
            <prop k="tweak_dash_pattern_on_corners" v="0"/>
            <prop k="use_custom_dash" v="0"/>
            <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <data_defined_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
      </axisSymbol>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings priority="0" linePlacementFlags="18" showAll="1" placement="0" zIndex="0" obstacle="0" dist="0">
    <properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties"/>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <legend type="default-vector"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field name="id" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="Adresse" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="Standort" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Schaden" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Zugang" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Absperrvor" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Schild" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Eisfrei" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Leistung" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Entlueftun" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Pruef_Dat" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Pruefer_Na" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Bemerkung" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Kontr_Dat" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Kontr_Nam" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Zufahrt" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Art" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="address" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" field="id" index="0"/>
    <alias name="" field="Adresse" index="1"/>
    <alias name="" field="Standort" index="2"/>
    <alias name="" field="Schaden" index="3"/>
    <alias name="" field="Zugang" index="4"/>
    <alias name="" field="Absperrvor" index="5"/>
    <alias name="" field="Schild" index="6"/>
    <alias name="" field="Eisfrei" index="7"/>
    <alias name="" field="Leistung" index="8"/>
    <alias name="" field="Entlueftun" index="9"/>
    <alias name="" field="Pruef_Dat" index="10"/>
    <alias name="" field="Pruefer_Na" index="11"/>
    <alias name="" field="Bemerkung" index="12"/>
    <alias name="" field="Kontr_Dat" index="13"/>
    <alias name="" field="Kontr_Nam" index="14"/>
    <alias name="" field="Zufahrt" index="15"/>
    <alias name="" field="Art" index="16"/>
    <alias name="" field="address" index="17"/>
  </aliases>
  <defaults>
    <default field="id" applyOnUpdate="0" expression=""/>
    <default field="Adresse" applyOnUpdate="0" expression=""/>
    <default field="Standort" applyOnUpdate="0" expression=""/>
    <default field="Schaden" applyOnUpdate="0" expression=""/>
    <default field="Zugang" applyOnUpdate="0" expression=""/>
    <default field="Absperrvor" applyOnUpdate="0" expression=""/>
    <default field="Schild" applyOnUpdate="0" expression=""/>
    <default field="Eisfrei" applyOnUpdate="0" expression=""/>
    <default field="Leistung" applyOnUpdate="0" expression=""/>
    <default field="Entlueftun" applyOnUpdate="0" expression=""/>
    <default field="Pruef_Dat" applyOnUpdate="0" expression=""/>
    <default field="Pruefer_Na" applyOnUpdate="0" expression=""/>
    <default field="Bemerkung" applyOnUpdate="0" expression=""/>
    <default field="Kontr_Dat" applyOnUpdate="0" expression=""/>
    <default field="Kontr_Nam" applyOnUpdate="0" expression=""/>
    <default field="Zufahrt" applyOnUpdate="0" expression=""/>
    <default field="Art" applyOnUpdate="0" expression=""/>
    <default field="address" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint unique_strength="0" constraints="0" field="id" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Adresse" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Standort" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Schaden" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Zugang" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Absperrvor" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Schild" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Eisfrei" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Leistung" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Entlueftun" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Pruef_Dat" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Pruefer_Na" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Bemerkung" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Kontr_Dat" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Kontr_Nam" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Zufahrt" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Art" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="address" notnull_strength="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="id" exp=""/>
    <constraint desc="" field="Adresse" exp=""/>
    <constraint desc="" field="Standort" exp=""/>
    <constraint desc="" field="Schaden" exp=""/>
    <constraint desc="" field="Zugang" exp=""/>
    <constraint desc="" field="Absperrvor" exp=""/>
    <constraint desc="" field="Schild" exp=""/>
    <constraint desc="" field="Eisfrei" exp=""/>
    <constraint desc="" field="Leistung" exp=""/>
    <constraint desc="" field="Entlueftun" exp=""/>
    <constraint desc="" field="Pruef_Dat" exp=""/>
    <constraint desc="" field="Pruefer_Na" exp=""/>
    <constraint desc="" field="Bemerkung" exp=""/>
    <constraint desc="" field="Kontr_Dat" exp=""/>
    <constraint desc="" field="Kontr_Nam" exp=""/>
    <constraint desc="" field="Zufahrt" exp=""/>
    <constraint desc="" field="Art" exp=""/>
    <constraint desc="" field="address" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="&quot;address&quot;" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column width="125" type="actions" hidden="1"/>
      <column name="id" width="43" type="field" hidden="0"/>
      <column name="Adresse" width="298" type="field" hidden="0"/>
      <column name="Leistung" width="88" type="field" hidden="0"/>
      <column name="Zugang" width="-1" type="field" hidden="0"/>
      <column name="Zufahrt" width="47" type="field" hidden="0"/>
      <column name="Absperrvor" width="72" type="field" hidden="0"/>
      <column name="Schild" width="44" type="field" hidden="0"/>
      <column name="Entlueftun" width="52" type="field" hidden="0"/>
      <column name="Schaden" width="-1" type="field" hidden="0"/>
      <column name="Eisfrei" width="43" type="field" hidden="0"/>
      <column name="Pruefer_Na" width="-1" type="field" hidden="0"/>
      <column name="Pruef_Dat" width="-1" type="field" hidden="0"/>
      <column name="Kontr_Nam" width="43" type="field" hidden="0"/>
      <column name="Kontr_Dat" width="43" type="field" hidden="0"/>
      <column name="Bemerkung" width="43" type="field" hidden="0"/>
      <column name="Standort" width="147" type="field" hidden="0"/>
      <column name="Art" width="81" type="field" hidden="0"/>
      <column name="address" width="335" type="field" hidden="0"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field name=" 20-06-29 Löschwasserbrunnen_Field10" editable="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field11" editable="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field12" editable="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field13" editable="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field14" editable="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field15" editable="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field16" editable="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field2" editable="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field3" editable="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field4" editable="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field5" editable="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field6" editable="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field7" editable="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field8" editable="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field9" editable="0"/>
    <field name="Absperrvor" editable="1"/>
    <field name="Adresse" editable="1"/>
    <field name="Art" editable="1"/>
    <field name="Befestigte" editable="1"/>
    <field name="Bemerkung" editable="1"/>
    <field name="Beschilder" editable="1"/>
    <field name="Beschädig" editable="1"/>
    <field name="Datum" editable="1"/>
    <field name="Eisfrei" editable="1"/>
    <field name="Entlueftun" editable="1"/>
    <field name="Entlüftun" editable="1"/>
    <field name="Ergiebigke" editable="1"/>
    <field name="Feuerwehrz" editable="1"/>
    <field name="Filter Roh" editable="1"/>
    <field name="Jederzeit" editable="1"/>
    <field name="Kontr_Dat" editable="1"/>
    <field name="Kontr_Nam" editable="1"/>
    <field name="Kontrolle" editable="1"/>
    <field name="Leistung" editable="1"/>
    <field name="Name" editable="1"/>
    <field name="Neuer Temporärlayer_test" editable="0"/>
    <field name="Pruef_Dat" editable="1"/>
    <field name="Pruefer" editable="1"/>
    <field name="Pruefer_Na" editable="1"/>
    <field name="Prüfer" editable="1"/>
    <field name="Rohr- / Fi" editable="1"/>
    <field name="Sauganschl" editable="1"/>
    <field name="Schaden" editable="1"/>
    <field name="Schild" editable="1"/>
    <field name="Standort" editable="1"/>
    <field name="Standortbe" editable="1"/>
    <field name="Zufahrt" editable="1"/>
    <field name="Zugaenglic" editable="1"/>
    <field name="Zugang" editable="1"/>
    <field name="absperrvor" editable="1"/>
    <field name="absperrvorrichtung" editable="0"/>
    <field name="address" editable="1"/>
    <field name="befestigt" editable="1"/>
    <field name="bemerkung" editable="0"/>
    <field name="besch?dig" editable="1"/>
    <field name="beschilder" editable="1"/>
    <field name="beschilderung" editable="0"/>
    <field name="beschädigungsschutz" editable="0"/>
    <field name="datum" editable="0"/>
    <field name="eisfrei" editable="0"/>
    <field name="entl?ftun" editable="1"/>
    <field name="entlüftungszeit" editable="0"/>
    <field name="f/r" editable="0"/>
    <field name="fwzufahrt" editable="0"/>
    <field name="id" editable="1"/>
    <field name="immer zug." editable="1"/>
    <field name="immer zugänglich" editable="0"/>
    <field name="leistung" editable="0"/>
    <field name="pr?fer" editable="1"/>
    <field name="prüfer" editable="0"/>
    <field name="standort" editable="0"/>
    <field name="standortbe" editable="1"/>
    <field name="standortbez" editable="0"/>
    <field name="x" editable="1"/>
    <field name="y" editable="1"/>
  </editable>
  <labelOnTop>
    <field name=" 20-06-29 Löschwasserbrunnen_Field10" labelOnTop="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field11" labelOnTop="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field12" labelOnTop="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field13" labelOnTop="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field14" labelOnTop="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field15" labelOnTop="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field16" labelOnTop="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field2" labelOnTop="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field3" labelOnTop="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field4" labelOnTop="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field5" labelOnTop="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field6" labelOnTop="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field7" labelOnTop="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field8" labelOnTop="0"/>
    <field name=" 20-06-29 Löschwasserbrunnen_Field9" labelOnTop="0"/>
    <field name="Absperrvor" labelOnTop="0"/>
    <field name="Adresse" labelOnTop="1"/>
    <field name="Art" labelOnTop="0"/>
    <field name="Befestigte" labelOnTop="0"/>
    <field name="Bemerkung" labelOnTop="0"/>
    <field name="Beschilder" labelOnTop="0"/>
    <field name="Beschädig" labelOnTop="0"/>
    <field name="Datum" labelOnTop="0"/>
    <field name="Eisfrei" labelOnTop="0"/>
    <field name="Entlueftun" labelOnTop="0"/>
    <field name="Entlüftun" labelOnTop="0"/>
    <field name="Ergiebigke" labelOnTop="0"/>
    <field name="Feuerwehrz" labelOnTop="0"/>
    <field name="Filter Roh" labelOnTop="0"/>
    <field name="Jederzeit" labelOnTop="0"/>
    <field name="Kontr_Dat" labelOnTop="0"/>
    <field name="Kontr_Nam" labelOnTop="0"/>
    <field name="Kontrolle" labelOnTop="0"/>
    <field name="Leistung" labelOnTop="0"/>
    <field name="Name" labelOnTop="0"/>
    <field name="Neuer Temporärlayer_test" labelOnTop="0"/>
    <field name="Pruef_Dat" labelOnTop="0"/>
    <field name="Pruefer" labelOnTop="0"/>
    <field name="Pruefer_Na" labelOnTop="0"/>
    <field name="Prüfer" labelOnTop="0"/>
    <field name="Rohr- / Fi" labelOnTop="0"/>
    <field name="Sauganschl" labelOnTop="0"/>
    <field name="Schaden" labelOnTop="0"/>
    <field name="Schild" labelOnTop="0"/>
    <field name="Standort" labelOnTop="0"/>
    <field name="Standortbe" labelOnTop="0"/>
    <field name="Zufahrt" labelOnTop="0"/>
    <field name="Zugaenglic" labelOnTop="0"/>
    <field name="Zugang" labelOnTop="0"/>
    <field name="absperrvor" labelOnTop="0"/>
    <field name="absperrvorrichtung" labelOnTop="0"/>
    <field name="address" labelOnTop="0"/>
    <field name="befestigt" labelOnTop="0"/>
    <field name="bemerkung" labelOnTop="0"/>
    <field name="besch?dig" labelOnTop="0"/>
    <field name="beschilder" labelOnTop="0"/>
    <field name="beschilderung" labelOnTop="0"/>
    <field name="beschädigungsschutz" labelOnTop="0"/>
    <field name="datum" labelOnTop="0"/>
    <field name="eisfrei" labelOnTop="0"/>
    <field name="entl?ftun" labelOnTop="0"/>
    <field name="entlüftungszeit" labelOnTop="0"/>
    <field name="f/r" labelOnTop="0"/>
    <field name="fwzufahrt" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="immer zug." labelOnTop="0"/>
    <field name="immer zugänglich" labelOnTop="0"/>
    <field name="leistung" labelOnTop="0"/>
    <field name="pr?fer" labelOnTop="0"/>
    <field name="prüfer" labelOnTop="0"/>
    <field name="standort" labelOnTop="0"/>
    <field name="standortbe" labelOnTop="0"/>
    <field name="standortbez" labelOnTop="0"/>
    <field name="x" labelOnTop="0"/>
    <field name="y" labelOnTop="0"/>
  </labelOnTop>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"id"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
