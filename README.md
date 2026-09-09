# 材料分析 — 論文報告共編說明

本專案使用 **XeLaTeX + GitHub** 進行多人協作撰寫。
請在開始編輯前**完整閱讀**本說明，以避免衝突與資料遺失。

---

## 專案結構

```
.
├── main.tex                  # 主文件（僅組長維護）
├── references.bib            # 參考文獻（僅文獻管理員維護）
├── .latexmkrc                # 編譯設定（請勿更動）
├── sections/
│   ├── 01_intro.tex          # 緒論
│   ├── 02_method.tex         # 研究方法
│   ├── 03_experiment.tex     # 實驗結果
│   └── 04_conclusion.tex     # 結論
├── figures/                  # 圖片（請見命名規範）
├── fonts/                    # 字型（請勿更動）
└── build/                    # 編譯輸出（已.gitignore，無需上傳）
```

---

## 分工表

> 請在下表填入組員姓名，並遵守「**一人一檔**」原則。

| 角色 | 姓名 | 負責檔案 | 圖片前綴 |
|------|------|----------|----------|
| 組長 | ＿＿＿ | `main.tex`、`sections/04_conclusion.tex` | `lead_` |
| 成員 A | ＿＿＿ | `sections/01_intro.tex` | `A_` |
| 成員 B | ＿＿＿ | `sections/02_method.tex` | `B_` |
| 成員 C | ＿＿＿ | `sections/03_experiment.tex` | `C_` |
| 文獻管理員 | ＿＿＿| `references.bib` | — |

---

## 環境準備（第一次使用）

### 1. 安裝必要工具

| 工具 | 用途 | 下載連結 |
|------|------|----------|
| GitHub Desktop | 圖形化 Git 操作 | https://desktop.github.com |
| VS Code | 文字編輯器 | https://code.visualstudio.com |
| VS Code 擴充：LaTeX Workshop | 即時預覽 LaTeX | VS Code 內搜尋安裝 |
| MiKTeX（Windows） | 本地編譯引擎(for Windows) | https://miktex.org |
| MacTeX (macOS) | 本地編譯引擎(for macOS) | https://www.tug.org/mactex/mactex-download.html |

### 2. Clone 專案到本地

1. 開啟 **GitHub Desktop**
2. 點選上方選單 `File` → `Clone repository...`
3. 切換到 `URL` 頁籤，貼上本 repo 網址
4. 選擇你想要存放的本地路徑
5. 點選 `Clone`

---

## 編輯的標準流程（GitHub Desktop）

> ⚠️ **每次開始工作前都要先同步！** 忽略這步是衝突的主因。

### Step 1 — 拉取最新版本

1. 開啟 **GitHub Desktop**，確認左上角 `Current Repository` 是本專案
2. 確認 `Current Branch` 為 `dev`
3. 點選上方 `Fetch origin`（抓取遠端資訊）
4. 若出現 `Pull origin`，點下去同步到本地

### Step 2 — 切換到自己的分支

1. 點選 `Current Branch` 下拉選單
2. 若沒有自己的分支（例如 `dev/A-intro`），點 `New Branch`
   - 名稱填入：`dev/A-intro`（依角色替換）
   - 確認 `from` 是 `dev`，點 `Create Branch`
3. 若已有自己的分支，直接切換過去

### Step 3 — 開始編輯

- 用 **VS Code** 開啟對應的 `.tex` 檔案
- **只編輯你負責的檔案**（見分工表）
- 若要新增圖片，放入 `figures/` 並遵守命名規範

### Step 4 — 提交變更（Commit）

1. 回到 **GitHub Desktop**，左側會列出所有變更檔案
2. 確認異動列表中**只有你負責的檔案**
3. 在左下角 `Summary` 欄填入簡短說明，例如：
   ```
   feat(intro): 完成研究背景段落
   fix(method): 修正 XRD 分析描述
   ```
4. 點選 `Commit to dev/A-intro`

### Step 5 — 推送並開 Pull Request

1. 點選右上角 `Push origin`（上傳到 GitHub）
2. 在 GitHub 網頁上，對 `dev/A-intro` → `dev` 開啟一個 **Pull Request**
3. 請求組長或同組成員 **Review** 後 Merge
4. Merge 完成後，記得回到 Step 1 重新拉取 `dev`

---

## 分支架構

```
main            ← 穩定版，CI 自動編譯並發布 PDF Release
  └── dev       ← 整合分支，所有 PR 匯入此處
        ├── dev/A-intro      ← 成員 A 個人工作分支
        ├── dev/B-method     ← 成員 B 個人工作分支
        └── dev/C-experiment ← 成員 C 個人工作分支
```

| 分支 | 誰可以 push？ |
|------|---------------|
| `main` | 禁止直接 push，只接受組長從 `dev` 發 PR |
| `dev` | 禁止直接 push，只接受透過 PR 合入 |
| `dev/xxx` | 個人分支，自由 push |

---

## 編輯規範

### LaTeX 撰寫

- **每個句子獨立一行**，方便 Git 精確追蹤差異：
  ```latex
  % V:建議
  本研究以 XRD 分析薄膜結晶結構。
  結果顯示在 500°C 退火後出現明顯繞射峰。

  % X:避免
  本研究以 XRD 分析薄膜結晶結構，結果顯示在 500°C 退火後出現明顯繞射峰。
  ```

- **每個 `.tex` 檔案開頭保留識別註解**：
  ```latex
  %! TeX root = ../main.tex
  % sections/01_intro.tex — 成員 A 負責
  ```

- **數值與單位**使用 `siunitx`：
  ```latex
  \SI{500}{\degreeCelsius}   % 溫度
  \SI{2.34}{\nano\metre}     % 長度
  \SI{45.2}{\degree}         % XRD 角度
  ```

### 圖片規範

- 圖片放入 `figures/` 目錄，**必須加個人前綴**，避免同名覆蓋：
  ```
  figures/A_sem_cross_section.png
  figures/B_xrd_pattern_500C.png
  figures/C_hrtem_lattice.png
  ```

- 建議格式：`.png`（截圖）或 `.pdf`（向量圖，最佳品質）
- 圖片寬度統一使用相對單位：
  ```latex
  \includegraphics[width=0.8\linewidth]{A_sem_cross_section}
  ```
- 圖片檔案單檔大小不超過5MB
### 參考文獻規範

- **不要自行修改 `references.bib`**，將文獻資訊（DOI、作者、標題）傳給文獻管理者
- 引用 key 命名格式：`作者姓_年份_關鍵字`，例如 `Chen_2023_XRD`
- 正文中引用：`\cite{Chen_2023_XRD}`

---

## 自動化 CI（GitHub Actions）

每次對 `main` 或 `dev` push，GitHub 會自動：

1. **編譯** `main.tex` → `build/main.pdf`
2. **上傳** PDF 為 Artifact（可在 Actions 頁面下載）
3. **發布 Release**（僅限 push 到 `main`）

> 若 CI 失敗（紅色 ✗），點進 Actions 查看錯誤訊息，通常是 `.tex` 語法錯誤或缺少圖片。

---

## 發生衝突怎麼辦？

1. **不要慌，不要強制覆蓋**
2. 在 GitHub Desktop 中，衝突檔案會標記 `!`
3. 用 VS Code 開啟衝突檔案，搜尋 `<<<<<<<`
4. 手動保留正確內容，刪除衝突標記
5. Commit 並標記 `fix: resolve merge conflict in 01_intro`
6. 若不確定，截圖傳給組長一起處理

---

## 溝通規範

| 情境 | 做法 |
|------|------|
| 要加新文獻 | 傳 DOI 給文獻管理員 |
| 要改 `main.tex` 結構 | 先告知組長討論 |
| 發現別人的筆誤 | 開 GitHub Issue 或直接告知，勿自行修改他人檔案 |
| PR 等待太久 | 在群組 @組長 |

---

*最後更新：2026-09-08*