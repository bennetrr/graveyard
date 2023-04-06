<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyAlgorithm="0" styleCategories="AllStyleCategories" simplifyLocal="1" simplifyDrawingTol="1" simplifyMaxScale="1" labelsEnabled="0" version="3.18.1-Zürich" minScale="100000000" maxScale="0" hasScaleBasedVisibilityFlag="0" simplifyDrawingHints="0" readOnly="0">
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
            <Option name="imageFile" value="D:/QGIS/Löschwasser/Styles/Hydranten.png" type="QString"/>
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
          <prop k="imageFile" v="D:/QGIS/Löschwasser/Styles/Hydranten.png"/>
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
    <rules key="{3323f76b-e205-47ab-9bb1-08f5e3a20b35}">
      <rule key="{89dd0a60-5715-4f82-bac3-4104747e82f3}" scalemindenom="1" scalemaxdenom="25000">
        <settings calloutType="simple">
          <text-style useSubstitutions="0" fontWeight="50" fieldName="'LWB ' + &#xd;&#xa;to_string(leistung)" fontStrikeout="0" fontKerning="1" fontSize="8" fontSizeMapUnitScale="3x:0,0,0,0,0,0" capitalization="0" fontFamily="MS Shell Dlg 2" textOpacity="1" namedStyle="Standard" previewBkgrdColor="255,255,255,255" textOrientation="horizontal" allowHtml="0" textColor="0,0,0,255" blendMode="0" isExpression="1" fontWordSpacing="0" multilineHeight="1" fontUnderline="0" fontLetterSpacing="0" fontItalic="0" fontSizeUnit="Point">
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
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="X" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Y" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Z" configurationFlags="None">
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
    <alias name="" field="X" index="1"/>
    <alias name="" field="Y" index="2"/>
    <alias name="" field="Z" index="3"/>
    <alias name="" field="address" index="4"/>
  </aliases>
  <defaults>
    <default field="id" applyOnUpdate="0" expression=""/>
    <default field="X" applyOnUpdate="0" expression=""/>
    <default field="Y" applyOnUpdate="0" expression=""/>
    <default field="Z" applyOnUpdate="0" expression=""/>
    <default field="address" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint unique_strength="0" constraints="0" field="id" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="X" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Y" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="Z" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" constraints="0" field="address" notnull_strength="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="id" exp=""/>
    <constraint desc="" field="X" exp=""/>
    <constraint desc="" field="Y" exp=""/>
    <constraint desc="" field="Z" exp=""/>
    <constraint desc="" field="address" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="&quot;Filter Roh&quot;" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column width="125" type="actions" hidden="1"/>
      <column name="X" width="-1" type="field" hidden="0"/>
      <column name="Y" width="-1" type="field" hidden="0"/>
      <column name="Z" width="-1" type="field" hidden="0"/>
      <column name="address" width="380" type="field" hidden="0"/>
      <column name="id" width="-1" type="field" hidden="0"/>
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
    <field name="AdSPMKey" editable="1"/>
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
    <field name="X" editable="1"/>
    <field name="Y" editable="1"/>
    <field name="Z" editable="1"/>
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
    <field name="AdSPMKey" labelOnTop="0"/>
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
    <field name="X" labelOnTop="0"/>
    <field name="Y" labelOnTop="0"/>
    <field name="Z" labelOnTop="0"/>
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
